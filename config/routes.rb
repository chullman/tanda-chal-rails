Rails.application.routes.draw do
  devise_for :users
  #resources :shifts
  #resources :organisations
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/home', to: 'home#index', as: 'home'
  root to: "home#index"
end
