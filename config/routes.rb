Rails.application.routes.draw do
  devise_for :admins, :controllers => { :omniauth_callbacks => "admins/omniauth_callbacks" }
  root 'welcome#index'
  get '/', to: 'welcome#index'
  get '/success', to: 'welcome#success'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get '/users', to: 'users#list'
  #resources :users
  resources :posts
  get '/blog', to: 'posts#index'
end
