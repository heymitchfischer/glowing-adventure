Rails.application.routes.draw do
  devise_for :restaurants, path: "restaurants", controllers: {
    sessions: "restaurants/sessions", 
    registrations: "restaurants/registrations"
  }
  devise_for :customers, path: "customers", controllers: {
    sessions: "customers/sessions", 
    registrations: "customers/registrations"
  }
  root 'restaurants#index'
  # resources :restaurants
end
