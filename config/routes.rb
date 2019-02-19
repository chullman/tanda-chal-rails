Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  
  resources :shifts, only: [:show, :create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  put '/organisations/:id/join', to: 'organisations#join_show', as: 'join_organisation_show'
  put '/organisations/:id/join', to: 'organisations#join', as: 'join_organisation'
  put '/organisations/:id/leave', to: 'organisations#leave', as: 'leave_organisation'
  resources :organisations, except: :destroy

  get '/home', to: 'home#index', as: 'home'
  root to: "home#index"
end
