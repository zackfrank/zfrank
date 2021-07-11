Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'users#new'

  resources :users, only: %i[new create], path: 'mailing-list'

  get '/p/:page' => 'pages#show'
end
