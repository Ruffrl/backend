# frozen_string_literal: true

# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  resources :profiles
  resources :accounts, except: %i[index]

  namespace :admin do
    # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
    # Can be used by load balancers and uptime monitors to verify that the app is live.
    get 'up' => '/rails/health#show', as: :rails_health_check

    resources :accounts, only: %i[index]
  end
end
