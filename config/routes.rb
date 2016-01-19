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

  # get '/user_groups' => 'user_groups#index'
  # get '/user_groups/new' => 'user_groups#new'
  post '/user_groups' => 'user_groups#create'
  # get '/user_groups/:id' => 'user_groups#show'
  # get '/user_groups/:id/edit' => 'user_groups#edit'
  patch '/user_groups/:id' => 'user_groups#update'
  delete '/user_groups/:id' => 'user_groups#destroy'

  # get '/user_events' => 'user_events#index'
  # get '/user_events/new' => 'user_events#new'
  post '/user_events' => 'user_events#create'
  # get '/user_events/:id' => 'user_events#show'
  # get '/user_events/:id/edit' => 'user_events#edit'
  patch '/user_events/:id' => 'user_events#update'
  delete '/user_events/:id' => 'user_events#destroy'

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
