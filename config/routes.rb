Rails.application.routes.draw do
  
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
  root 'users#login'
  resources :users, only: [:show]
  resources :scripts, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :groups
  resources :group_scripts, only: [:new, :create, :destroy]
  resources :group_users, only: [:new, :create, :update, :destroy]
  resources :comments, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
