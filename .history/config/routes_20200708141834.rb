Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'users#index'
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  
  resources :users
  resources :services
  resources :profiles
  put "/users/:id/destroy" => "users#destroy", as: 'users_destroy'
end
