Rails.application.routes.draw do

  resources :vms

  resources :users
  resources :apps do
    resources :service_in_apps
  end


  root to: 'visitors#index'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure', :as=> :sessions_failure

  get '/users'=> 'users#index'
  get '/users/:id/mesapps' => 'users#mesapps', :as=>:mesapps


  # pages ZONE: DSI, ADMIN
  get '/admin' =>'users#admin', :as=>:admin
  get '/users/:id/dsi' =>'users#dsi', :as=>:dsi
end
