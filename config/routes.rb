Rails.application.routes.draw do
  root 'dasboard#index'

  resources :votes
  resources :users
  resources :foodtrucks

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
