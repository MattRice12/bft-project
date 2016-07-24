Rails.application.routes.draw do

  resources :favorites
  resources :votes

  resources :users do
    post 'favorites' => "users#favorites", on: :member
    post 'vote' => "users#vote", on: :member
  end
  resources :foodtrucks do
    # get "users" => "quotes#voting_users", on: :member
    post 'vote' => "foodtrucks#vote", on: :member
  end

  post '/sign-in', to: "sessions#sign_in", as: :sign_in

  root 'dashboard#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
