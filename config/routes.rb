Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  #resources :shifts

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post '/organisations/:id', to: 'organisations#join', as: 'join_organisation'
  resources :organisations, except: :destroy

  get '/home', to: 'home#index', as: 'home'
  root to: "home#index"
end
