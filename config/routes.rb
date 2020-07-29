Rails.application.routes.draw do

  get '/auth/:provider/callback', to: 'session#omniauth'
  
  root 'static#home'
  
  get '/signin', to: 'session#new'
  post '/session', to: 'session#create'
  get '/signout', to: 'session#destroy'

  get '/signup', to: 'users#new'
  post '/users', to: 'users#create'

  delete '/services/:id', to: 'services#destroy'
  delete '/projects/:id', to: 'projects#destroy'

  resources :users, only: [:index, :show]
  resources :projects, only: [:index, :show, :create, :new, :edit, :update] do
    resources :services, only: [:index, :show, :create, :new, :edit, :update]
  end
  
  resources :services, only: [:index, :show, :create, :new, :edit, :update]
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
