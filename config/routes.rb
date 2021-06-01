Rails.application.routes.draw do
  get 'messages/create'
  devise_for :users
  root to: 'pages#home'
  resources :rooms, only: [:index, :show] do
    resources :messages, only: [:create]
    resources :surveys, only: [:create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
