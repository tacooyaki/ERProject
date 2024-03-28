Rails.application.routes.draw do
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

  root 'home#index'

  # Route for a products categories
  get 'categories', to: 'categories#index'

  # Route for searching through products
  get 'search_products', to: 'products#search'

  # Resources for products
  resources :products

end
