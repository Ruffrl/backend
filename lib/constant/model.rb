# frozen_string_literal: true

# Create custom constant behavior that can
# - be available globally
# - have a clear and straightforward interface
# - be easily extendable and maintainable
# - be frozen and not modifiable after initialization
# - be namespaced to avoid overwriting
# - give direct access to any array element
# - ability to return all values from defined array
# - use a name that is related to constant instead of Rails.configuration
# - keep constants namespaced for separate models
module Constant
  class Model

    def initialize(constant_hash = {})
      @constant_hash = constant_hash.deep_symbolize_keys.freeze
    end

    def deep_transform
      tap { constant_hash.each { |key, value| define_singleton_method(key) { initialize_value(value) } } }
    end

    # provides missing hash methods ( for example '.values' etc. )
    delegate_missing_to :constant_hash

    private

    attr_reader :constant_hash

    def initialize_value(value)
      case value
      when Hash then Model.new(value).deep_transform
      when Array then Model.new(value.index_by(&:itself)).deep_transform
      else value.freeze
      end
    end

  end
end