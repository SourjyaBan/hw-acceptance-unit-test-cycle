Rottenpotatoes::Application.routes.draw do
  resources :movies
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
  get 'director_movies/:title' => 'movies#director_movies', as: :director_movies
end
