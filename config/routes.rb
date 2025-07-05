Rails.application.routes.draw do
  get "notifications/index"
  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # PWA routes
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Root route (home page)
  root to: "pages#home"

  # Routes for pages
  get "/profile", to: "pages#profile", as: :profile  # Add this line
  get 'profile_tab', to: 'pages#profile_tab'

  

   get '/map', to: 'map#index', as: :map

  get "/messages", to: "messages#index", as: :messages  # Add this line
  get "/messages/:id", to: "messages#show", as: :message  # Add this line
  post "/update_location", to: "users#update_location"

  get "/workouts", to: "pages#workouts", as: :workouts
  get "/settings", to: "pages#settings", as: :settings  # Add this line

  # Resources for gyms
  resources :messages, only: [:index, :show, :create]
  resources :notifications, only: [:index]
  resources :suggestions, only: [:create]


  resources :users, only: [] do
  post :update_location, on: :collection
end



  resources :gyms, except: [:index, :show]
end
