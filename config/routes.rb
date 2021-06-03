Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :rooms, only: [:index, :show] do
    resources :messages, only: [:create]
    resources :surveys, only: [:create]
  end
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get '/allrooms', to: 'base#index'
      post '/surveys', to: 'base#create'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
