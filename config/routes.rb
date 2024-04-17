Rails.application.routes.draw do

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'products#index'

  resources :products, only: [:index, :show]

  resources :categories, only: [:index] do
    resources :products, only: [:index], path: 'products', as: 'category_products'
  end

  get '/pages/:slug', to: 'pages#show', as: :static_page

  # Shopping cart
  get '/cart', to: 'carts#show', as: 'cart'
  post '/add_to_cart/:product_id', to: 'carts#add_to_cart', as: 'add_to_cart'
  patch '/update_cart_item/:product_id', to: 'carts#update_cart_item', as: 'update_cart_item'
  delete '/remove_from_cart/:product_id', to: 'carts#remove_from_cart', as: 'remove_from_cart'

  # Order processing
  resources :orders, only: [:new, :create, :show] do
    get 'confirmation', on: :member, as: 'confirmation_order'
  end

  get 'products/search', to: 'products#search', as: :search_products

  # testing
  #get 'orders/:id/confirmation', to: 'orders#confirmation', as: 'order_confirmation'
  #get ':id/confirmation', to: 'orders#confirmation', as: 'confirmation'

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check
end
