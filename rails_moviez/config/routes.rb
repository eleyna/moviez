RailsMoviez::Application.routes.draw do
  root :to => 'welcome#index', as: 'root'
  post '/movies' => 'movies#create', as: 'create'
  get '/movies/index' => 'movies#index', as: 'index'
  get '/movies/faves_saves' => 'movies#faves_saves', as: 'faves_saves'
  post '/movies/update/:id' => 'movies#update_movie', as: 'update_movie'
  get '/movies/saves_faves/:id' => 'movies#show_faves_saves', as: 'movies_faves_saves'
  get '/movies/:id' => 'movies#show', as: 'movies'
  get '/actors' => 'movies#show_actors', as: 'actors'
end
