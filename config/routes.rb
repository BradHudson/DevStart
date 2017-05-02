Rails.application.routes.draw do
  root 'welcome#index'
  get '/', to: 'welcome#index'
  get '/success', to: 'welcome#success'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get '/users', to: 'users#list'
  #resources :users
end
