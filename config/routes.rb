Rails.application.routes.draw do

  # Public resources
  root to: 'visitors#index'
  get '/lang/:lang', to: 'application#change_language', as: 'change_language'
  get '/show/:id', to: 'visitors#show', as: 'show'
  get '/update_holders', to: 'visitors#update_holders', as: 'update_holders'
  get '/inicio.do', to: 'uweb_access#uweb_sign_in'
  get '/agenda/:holder/:full_name', to: 'visitors#agenda', as: 'agenda'
  get '/import', to: 'users#import', as: 'import'
  resources :organizations, only: [:index, :show]

  # Admin
  get "/admin", to: 'events#index', as: 'admin'

  devise_for :users, controllers: { session: "users/sessions" }
  get 'admin/edit_password', to: 'admin/passwords#edit', as: 'edit_password'
  match 'admin/update_password', to: 'admin/passwords#update', as: 'update_password', via: [:patch, :put]

  resources :users

  resources :events

  resources :holders

  resources :areas

  resources :activities

  namespace :admin do
    resources :organizations
  end

end
