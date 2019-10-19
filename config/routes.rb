Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :deliveries
  resources :transportation_times
  resources :cities
  resources :cargos
  resources :receive_times
  resources :load_times
  resources :storage_times
  resources :picking_times
  resources :trucks
  resources :drivers

  resources :delivery_probabilities, only: %i[index]

end
