Rails.application.routes.draw do
  devise_for :users
  
  get '/' => 'pages#index'

  get '/dashboards' => 'dashboards#index', as: :user_root
  get '/dashboards/:id' => 'dashboards#show'
  
  get '/groups' => 'groups#index'
  get '/groups/new' => 'groups#new'
  post '/groups' => 'groups#create'
  get '/groups/:id' => 'groups#show'
  get '/groups/:id/edit' => 'groups#edit'
  patch '/groups/:id' => 'groups#update'
  delete '/groups/:id' => 'groups#destroy'

  get '/events' => 'events#index'
  get '/events/new' => 'events#new'
  post '/events' => 'events#create'
  get '/events/:id' => 'events#show'
  get '/events/:id/edit' => 'events#edit'
  patch '/events/:id' => 'events#update'
  delete '/events/:id' => 'events#destroy'

  get '/fields' => 'fields#index'
  get '/fields/new' => 'fields#new'
  post '/fields' => 'fields#create'
  get '/fields/:id' => 'fields#show'
  get '/fields/:id/edit' => 'fields#edit'
  patch '/fields/:id' => 'fields#update'
  delete '/fields/:id' => 'fields#destroy'

  # get '/field_conditions' => 'field_conditions#index'
  get '/field_conditions/new' => 'field_conditions#new'
  post '/field_conditions' => 'field_conditions#create'
  # get '/field_conditions/:id' => 'field_conditions#show'
  get '/field_conditions/:id/edit' => 'field_conditions#edit'
  patch '/field_conditions/:id' => 'field_conditions#update'
  # delete '/field_conditions/:id' => 'field_conditions#destroy'

  namespace :api do
    namespace :v1 do
      get '/groups' => 'groups#index'
      get '/events' => 'events#index'
      get '/fields' => 'fields#index'
      get '/field_conditions' => 'field_conditions#index'
      get '/user_groups' => 'user_groups#index'
      get '/user_events' => 'user_events#index'
    end
  end
end
