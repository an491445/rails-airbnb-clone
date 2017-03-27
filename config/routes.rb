Rails.application.routes.draw do
  get 'minivans/index'

  get 'minivans/show'

  get 'minivans/new'

  get 'minivans/create'

  get 'minivans/edit'

  get 'minivans/update'

  get 'minivans/destroy'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
