Rails.application.routes.draw do

  resources :minivans, only: [:show, :index]

  resources :users, only: [:index, :show] do
    resources :minivans, only: [:new, :create, :update, :edit, :destroy] do
      resources :bookings, only: [:create, :index]
    end
  end

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
