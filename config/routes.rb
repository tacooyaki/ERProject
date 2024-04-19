Rails.application.routes.draw do

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'products#index'

  resources :users do
    resources :addresses, only: [:new, :create, :edit, :update, :destroy]
    resources :orders, only: [:index], as: 'user_orders'
  end

  resources :orders, only: [:new, :create, :show, :index] do
    post 'review', on: :member
    post 'confirmation', on: :member
  end

  get 'user_orders', to: 'orders#index', as: 'user_orders'

  post 'orders/:id/update_financials', to: 'orders#update_financials', as: :update_order_financials

  resources :products, only: [:index, :show]
  resources :categories, only: [:index] do
    resources :products, only: [:index], path: 'products', as: 'category_products'
  end

  get '/cart', to: 'carts#show', as: 'cart'
  post '/add_to_cart/:product_id', to: 'carts#add_to_cart', as: 'add_to_cart'
  patch '/update_cart_item/:product_id', to: 'carts#update_cart_item', as: 'update_cart_item'
  delete '/remove_from_cart/:product_id', to: 'carts#remove_from_cart', as: 'remove_from_cart'

  get 'products/search', to: 'products#search', as: :search_products

  resources :orders do
    member do
      post :update_financials
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
