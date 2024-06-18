Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "users#login"
  post '', to: 'users#loginUser', as: "login"

  get 'logout', to: "users#logoutPage", as: "logoutPage"
  # post '', to: "users#logout", as: "logout"

  match 'acceuil', to: 'users#acceuil', via: [:get, :post], as: "acceuil"
  # get 'acceuil', to: 'users#acceuil', as: 'acceuil'
  # post 'acceuil', to: "users#shodanSearch", as: 'shodan_search'
  
  get 'signup', to: 'users#signup', as: "signup"
  post 'createUser', to: 'users#createUser', as: "createUser"

  get "adminPage/:id", to: "users#destroy", as: 'destroy_user'

  get 'adminPage', to: "users#adminPage", as: "adminPage"

  # get '/patients/:id', to: 'patients#show', as: 'patient'
  # match 'photos', to: 'photos#show', via: [:get, :post]

end
