Rails.application.routes.draw do
  devise_for :buyers
  devise_for :sellers
  root "home#index"
  resources :buyers, only: [ :index, :show, :edit, :update ]
  resources :sellers, only: [ :index, :show, :edit, :update ] do
    resources :testimonials, only: [ :new, :create, :edit, :update, :destroy ]
    resources :projects, only: [ :new, :create, :edit, :update, :destroy ]
  end

  resources :conversations, only: [ :index, :show, :create ] do
    resources :messages, only: [ :create ]
    post :start, on: :collection
  end

  get "/states", to: "states#index"
  get "/cities", to: "cities#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
