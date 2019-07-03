Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'root#show'

  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecast#show'
      get '/backgrounds', to: 'backgrounds#show'
      post '/users', to: 'users#create'
      post '/sessions', to: 'sessions#create'
      get '/antipode', to: 'antipode#show'
      post '/favorites', to: 'favorites#create'
      get '/favorites', to: 'favorites#index'
      delete '/favorites', to: 'favorites#destroy'
    end
  end
end
