Rails.application.routes.draw do

  resources :users,:apps
    #resources :apps, only: [:show, :new, :create, :destroy]

  root to: 'visitors#index'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'

  get '/users'=> 'users#index'
  get '/users/:id/mesapps' => 'users#mesapps', :as=>:mesapps


  get '/apps/:id/edit-tech' => "apps#edit_tech", :as=> :app_tech
  #get '/apps/new' => "apps#new", :as=> :create_app
  #get '/apps/:id/edit' => "apps#edit", :as=>:edit_app
  #patch '/apps/:id' => "apps#update"
end
