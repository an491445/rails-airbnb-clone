Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :minivans, only: [:index] do
    resources :bookings, only: [:create, :show, :edit, :update, :destroy]
  end

  resources :bookings, only: [:show]

  resources :users, only: [:index, :show] do
    resources :minivans, only: [:show, :new, :create, :update, :edit, :destroy]
  end

  resource :profile, only: [:edit, :update, :show]


  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
