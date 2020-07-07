Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'users#index'
  devise_for :users
  resources :users
  resources :services
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
