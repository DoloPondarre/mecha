Rails.application.routes.draw do
  
  devise_for :admin

  namespace :admin do
    root to: "products#index"
    resources :products do
      patch 'toggle_availability', on: :member
      patch 'toggle_featured', on: :member
    end
  end

  root to: 'home#index'
  
  resources :products, only: [:index, :show]
  resource :cart, only: [:show, :create]
  resources :orders, only: [:new, :create]

  get 'orders/:id/whatsapp', to: 'orders#whatsapp', as: 'order_whatsapp'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
