Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
  get "/products" => "products#index"
  get "/products/:id" => "products#show"
  post "/products" => "products#create"
  patch "/products/:id" => "products#update"
  delete "/products/:id" => "products#destroy"

  get "/images" => "images#index"
  get "/images/:id" => "images#show"
  post "/images" => "images#create"
  patch "/images/:id" => "images#update"
  delete "/images/:id" => "images#destroy"

  post "/users" => "users#create"

  post "/sessions" => "sessions#create"

  get "/orders"        => "orders#index"
  get "/orders/:id"    => "orders#show"
  post "/orders"       => "orders#create"
  patch "/orders/:id"  => "orders#update"
  delete "/orders/:id" => "orders#destroy"

  get "/categories"    => "categories#index"

  get "carted_products"           => "carted_products#index"
  get "/carted_products/:id"      => "carted_products#show"
  post "/carted_products"         => "carted_products#create"
  delete "/carted_products/:id"   => "carted_products#destroy"
end
