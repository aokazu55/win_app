Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'users#index'
  devise_for :users
  resources :users
  resources :services
  # put "/users/:id/hide" => "users#hide", as: 'users_hide'
end
