Rails.application.routes.draw do
  root 'homes#index'
  get '/homes', to: 'homes#index'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/login', to: 'homes#login'
  resources :users
  resources :code_lists
  resources :exchange_lists
end
