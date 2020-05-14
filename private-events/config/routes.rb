Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]

  get '/users/:id/attend/:event_id' => 'users#attend', as: :attend
  get '/users/:id/do_not_attend/:event_id' => 'users#do_not_attend', as: :do_not_attend
  get '/users/:id/attended_events' => 'users#attended_events', as: :attended_events
  
  resources :events
  root "events#index"
end
