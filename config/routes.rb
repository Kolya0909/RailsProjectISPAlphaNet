Rails.application.routes.draw do
  resources :onts
  devise_for :users
  get 'persons/profile'
  get '/addonu' => 'onts#addonu'
  post '/addonu' => 'onts#addonu'
  get '/add_router' => 'routers#add_router'
  post '/add_router' => 'routers#add_router'
  get '/lists/:id/closeWork' =>'lists#closeWork'
  post '/lists/:id/closeWork' =>'lists#closeWork'
  post '/closeWork' => 'lists#closeWork'
  root 'lists#index'	
  resources :lists
  resources :routers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
