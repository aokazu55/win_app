Rails.application.routes.draw do

  root 'users#index'
  devise_for :users,
    controllers: {
      sessions: 'devise/sessions',
      registrations: "users/registrations",
      # omniauth_callbacks: 'users/omniauth_callbacks'
  }
  resources :users
  resources :services
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
