Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
    get '/users/password', to: 'devise/passwords#update'
  end
 

  
  resources :shifts, only: [:show, :create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/organisations/:id/join', to: 'organisations#join'
  put '/organisations/:id/join', to: 'organisations#join', as: 'join_organisation'
  get '/organisations/:id/leave', to: 'organisations#leave'
  put '/organisations/:id/leave', to: 'organisations#leave', as: 'leave_organisation'
  resources :organisations, except: :destroy

  get '/home', to: 'home#index', as: 'home'
  root to: "home#index"
end
