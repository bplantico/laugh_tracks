Rails.application.routes.draw do
  resources :comedians
  get '/', to: 'comedians#welcome'
  # get  '/comedians', to: 'comedians#index'
  # get  '/comedians/new', to: 'comedians#new'
  # post '/comedians', to: 'comedians#create'
  # get  '/comedians/:id', to: 'comedians#show'
  # get  '/comedians/:id', to: 'comedians#edit'
  # patch '/comedians/:id', to: 'comedians#update'
  # put '/comedians/:id', to: 'comedians#update'
  # delete '/comedians/:id', to: 'comedians#destroy'

end
