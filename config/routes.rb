Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations'}

  devise_scope :user do
    authenticated :user do
      root 'users#profile', as: :authenticated_root
      get 'profile' => "users#profile"
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :users
  resources :scripts, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :groups
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
