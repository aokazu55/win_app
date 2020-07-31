Rails.application.routes.draw do
  get 'credit_card/confirmation'
  get 'credit_card/edit'
  get 'credit_card/show'
  get 'transactions/pay_index'
  get 'transactions/done'
  get 'transactions/show'
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

  resources :profiles
  put "/users/:id/destroy" => "users#destroy", as: 'users_destroy'

  resources :credit_card, only: [:create, :show, :edit] do
    collection do
      post 'delete', to: 'credit_card#delete'
      post 'show'
    end
    member do
      get 'confirmation'
    end
  end 

end
