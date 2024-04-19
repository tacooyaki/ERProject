Rails.application.routes.draw do
  # Devise
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Root
  root 'products#index'

  # Users and Addresses
  resources :users do
    resources :addresses, only: [:new, :create, :edit, :update, :destroy]
    get 'orders', to: 'orders#index', as: 'user_orders'  # Adds a user-specific orders path
  end

# new add
  post 'orders/process_review', to: 'orders#process_review', as: 'process_review_order'

  # Orders
  resources :orders, except: [:edit, :update, :destroy] do
    collection do
      get 'recalculate'
      post 'review'
      get 'display_review'
    end
    member do
      get 'confirmation'
    end
  end

  # Recalculate
  get 'recalculate', to: 'orders#recalculate', as: 'recalculate_order'

  # Shopping Cart
  resources :products, only: [:index, :show]
  resources :categories, only: [:index] do
    resources :products, only: [:index], path: 'products', as: 'category_products'
  end

  get '/cart', to: 'carts#show', as: 'cart'
  post '/add_to_cart/:product_id', to: 'carts#add_to_cart', as: 'add_to_cart'
  patch '/update_cart_item/:product_id', to: 'carts#update_cart_item', as: 'update_cart_item'
  delete '/remove_from_cart/:product_id', to: 'carts#remove_from_cart', as: 'remove_from_cart'

  get 'products/search', to: 'products#search', as: :search_products

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check
end
