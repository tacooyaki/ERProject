Rails.application.routes.draw do
  get 'home/index'
  get 'categories/index'
  get 'pages/show'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  get '/pages/:slug', to: 'pages#show', as: :static_page

  #root 'home#index' Using products index as root - this is no longer used.

  root 'products#index'
  # Route for a products categories
  get 'categories', to: 'categories#index'

  # route for searching through products
  get 'products/search', to: 'products#search', as: :search_products

  # Resources for products
  resources :products, only: [:index, :show]

  # Filters products by category
  resources :categories, only: [] do
    resources :products, only: [:index], path: 'category_products'
  end

end
