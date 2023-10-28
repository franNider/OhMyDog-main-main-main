Rails.application.routes.draw do
  get 'inicio/index'
  get 'turnos/index'
  get 'authentication/sessions/new'

  resources :main
  namespace :authentication, path: '', as: '' do
    resources :users, only: [:new, :create]
    resources :sessions, only: [:new, :create]
  end
  get 'logout', to: 'authentication/sessions#destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "inicio#index"
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
