Rails.application.routes.draw do

  resources :minivans, only: [:show, :index] do
    resources :bookings, only: [:create, :index]
  end

  resources :bookings, only: [:show]

  resources :users, only: [:index, :show] do
    resources :minivans, only: [:new, :create, :update, :edit, :destroy]
  end

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
