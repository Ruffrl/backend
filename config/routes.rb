# frozen_string_literal: true

# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  post 'sign_in', to: 'sessions#create'
  post 'sign_up', to: 'registrations#create'

  resources :sessions, only: %i[index show destroy]
  resource  :password, only: %i[edit update]

  namespace :identity do
    resource :email,              only: %i[edit update]
    resource :email_verification, only: %i[show create]
    resource :password_reset,     only: %i[new edit create update]
  end
  resources :profiles
  # resources :accounts, except: %i[index]

  namespace :admin do
    # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
    # Can be used by load balancers and uptime monitors to verify that the app is live.
    get 'up' => '/rails/health#show', as: :rails_health_check

    # resources :accounts, only: %i[index]
  end
end
