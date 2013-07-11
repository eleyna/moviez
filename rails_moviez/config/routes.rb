RailsMoviez::Application.routes.draw do
  root :to => 'welcome#index', as: 'root'
  post '/movies' => 'movies#create', as: 'create'
  get '/movies/index' => 'movies#index', as: 'index'
  get '/movies/faves' => 'movies#faves', as: 'faves'
  get '/movies/saves' => 'movies#saves', as: 'saves'
  get '/movies/:id' => 'movies#show', as: 'movies'
end
