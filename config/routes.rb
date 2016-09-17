Rails.application.routes.draw do
  get '/', to: 'dashboard#home'
  get '/about', to: 'dashboard#about'
  get '/contact', to: 'dashboard#contact'

  get '/products', to: 'products#index'
  get '/products/:title', to: 'products#show'
  get '/upload', to: 'projects#new'
end
