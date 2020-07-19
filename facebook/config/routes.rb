Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations', omniauth_callbacks: 'omniauth_callbacks' }

  resources :users, only:[:show, :index, :update]
  resources :posts do
    resources :comments
    resources :thumbs
  end
  resources :friendships
  resources :notifications
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "posts#index"
end
