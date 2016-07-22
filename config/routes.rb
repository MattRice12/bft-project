Rails.application.routes.draw do

  resources :votes
  resources :users
  resources :foodtrucks do
    member do
      post 'vote'
    end
  end

  root 'dashboard#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
