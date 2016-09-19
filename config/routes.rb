Rails.application.routes.draw do
  get '/', to: 'dashboard#home'
  get '/about', to: 'dashboard#about'
  get '/contact', to: 'dashboard#contact'

  get '/products', to: 'products#index'
  get '/products/:name', to: 'products#show', as: 'product'

  resources :projects, only: [:new, :create, :show]
  resources :attachments, only: [:new, :create, :show]

  namespace 'api', defaults: { :format => 'json' } do
    namespace 'v1' do
      resources :attachments, only: [:new, :create, :show]
    end
  end
end
