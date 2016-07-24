Rails.application.routes.draw do

  resources :votes

  resources :users do
    post 'vote' => "users#vote", on: :member
  end
  resources :foodtrucks do
    # get "users" => "quotes#voting_users", on: :member
    post 'vote' => "foodtrucks#vote", on: :member
  end

  post '/sign-in', to: "sessions#sign_in", as: :sign_in
  post '/sign-up', to: "users#create", as: :sign_up

  root 'dashboard#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
