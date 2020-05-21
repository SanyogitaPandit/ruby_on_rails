Rails.application.routes.draw do
  devise_for :passangers
  resources :flights
  resources :airports
  resources :bookings
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "flights#index"
end
