Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'users#index'
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  resources :users
  resources :services do
    resources :comments, only: [:create, :destroy, :edit, :update]
  end

  resources :trades, only: [:create, :destroy, :show, :index] do
    member do
      get 'contract', to: 'trades#contract'
    end
  end
  resources :profiles
  put "/users/:id/destroy" => "users#destroy", as: 'users_destroy'
end
