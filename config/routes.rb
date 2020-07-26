Rails.application.routes.draw do

  
  root 'static#home'
  
  get '/signin', to: 'session#new'
  post '/session', to: 'session#create'
  get '/signout', to: 'session#destroy'

  get '/signup', to: 'users#new'
  post '/users', to: 'users#create'

  resources :users, only: [:index, :show]
  resources :projects, only: [:index, :show, :create, :new, :edit, :update]
  delete '/services/:id', to: 'services#destroy'
  resources :services, only: [:index, :show, :create, :new, :edit, :update]
  delete '/projects/:id', to: 'projects#destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
