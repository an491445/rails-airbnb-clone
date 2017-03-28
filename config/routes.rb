Rails.application.routes.draw do

  resources :users, only: [:index, :show] do
    resources :minivans do
      resources :bookings, only: [:create, :index]
    end
  end

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
