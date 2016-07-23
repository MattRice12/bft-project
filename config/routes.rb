Rails.application.routes.draw do

  resources :votes
  resources :users

  get '/sign-in', to: "sessions#sign_in", as: :sign_in
  get '/sign-out', to: "sessions#sign_out", as: :sign_out

  resources :foodtrucks do
    get "users" => "quotes#voting_users", on: :member
    post 'vote' => "foodtrucks#vote", on: :member
  end

  root 'dashboard#index'





  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
