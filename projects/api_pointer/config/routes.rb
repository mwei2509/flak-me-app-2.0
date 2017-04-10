Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/googlemaps', to: 'googlemaps#index'
  get '/googlemapsapi', to: 'googlemaps#api'
end
