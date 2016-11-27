Rails.application.routes.draw do

  # Routes for non restful paths: home, about, contact
  get '/', to: 'dashboard#home'
  get '/about', to: 'dashboard#about'
  get '/contact', to: 'dashboard#contact'

  # Routes for admin to login in
  get 'login',   to: 'sessions#new'
  post 'login',  to: 'sessions#create'
  get 'logout',  to: 'sessions#destroy'

  # admin routes which allow admin to create new projects
  get '/admin', to: 'admin#dashboard'
  get '/admin/dashboard', to: 'admin#dashboard'

  namespace 'admin' do
    resources :users, only: [:new, :create]
    get '/products', to: 'products#index'
    get '/products/:name', to: 'products#show', as: 'product'
    resources :product_styles, only: [:new,:create]
  end

  # Routes to see initial gallery which has all products
  get '/products', to: 'products#index'
  get '/products/:name', to: 'products#show', as: 'product'

  # Routes which all user to make calls to create or see attachments
  resources :attachments, only: [:new, :create, :show]

  # Api endpoints which all user to make ajax calls to create or see attachments
  namespace 'api', defaults: { :format => 'json' } do
    namespace 'v1' do
      resources :attachments, only: [:new, :create, :show]
      get '/style_attachments', to: 'attachments#style_attachments'




      resources :products, only: [:show] do 
        resources :product_styles, only: [:index]
      end
    end
  end
end
