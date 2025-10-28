Rails.application.routes.draw do

  
  get "users/search", to: "users#search"

  
  root to: "welcome#index"
  devise_for :users

  authenticated :user do
    root to: 'home#index', as: :authenticated_root
  end

  unauthenticated do
    root to: 'welcome#index', as: :unauthenticated_root
  end
  



  get "workouts/index"
  get "notifications/index"
  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # PWA routes
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest


  # Routes for pages
  get "/profile", to: "pages#profile", as: :profile  # Add this line
  get 'profile_tab', to: 'pages#profile_tab'

  

  delete '/posts/:id', to: 'posts#destroy', as: 'delete_post'

  get '/map', to: 'map#index', as: :map
    
  get '/home', to: 'home#index', as: :home
  get "/welcome", to: "welcome#index", as: :welcome

  get '/map/nearby_gyms', to: 'map#nearby_gyms'


  get "/messages", to: "messages#index", as: :messages  # Add this line
  get "/messages/:id", to: "messages#show", as: :message  # Add this line
  post "/update_location", to: "users#update_location"

  get '/workouts', to: 'workouts#index', as: :workouts
  get "/settings", to: "pages#settings", as: :settings  # Add this line




   # Follow requests
  resources :follow_requests, only: [:index, :update, :destroy]

  # config/routes.rb
resources :follows, only: [:create, :destroy]




  # Resources for gyms
resources :messages, only: [:index, :show, :create]
  resources :notifications, only: [:index]
  resources :suggestions, only: [:create]
  # config/routes.rb
resources :profiles, only: [:show]
# e.g., profile_path for current_user

  resources :posts, only: [:create, :index, :show] # add other actions if needed
# config/routes.rb
resources :posts do
  member do
    get  :likes_count
    get  :saved_status
    post :save
    
    post :toggle_like, to: 'likes#toggle'
    delete :unsave
  end

    resources :comments, only: [:create, :index]  # <- add this

    
end

  resources :comments, only: [:index, :create]

resources :users, only: [:show] do
  collection do
    get :search
  end
end




  resources :gyms, except: [:index, :show]
end
