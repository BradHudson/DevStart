Rails.application.routes.draw do
  root 'welcome#index'
  get '/', to: 'welcome#index'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get '/users', to: 'users#list'
  #resources :users
end
