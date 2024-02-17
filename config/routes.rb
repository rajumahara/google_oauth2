Rails.application.routes.draw do
  devise_for :users, controllers: { 
    registrations: 'user/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks' 
  }
  get "up" => "rails/health#show", as: :rails_health_check

  root 'pages#home'

  resources :pages
  resources :employees
  resources :settings
  resources :messages
end
