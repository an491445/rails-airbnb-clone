Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :minivans, only: [:index]

  resources :users, only: [:index, :show] do
    resources :minivans, only: [:show, :new, :create, :update, :edit, :destroy] do
      resources :bookings, only: [:create, :show, :edit, :update, :destroy] do
        resources :reviews, only: [:new, :create]
      end
    end
  end

  resource :profile, only: [:edit, :update, :show]


  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

