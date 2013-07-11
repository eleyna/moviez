class MoviesController < ActionController::Base

  def index
    @movies = Imdb::Search.new(params[:title]).movies
  end

  def show
    @id = params[:id]
    @movie_info = Imdb::Movie.new(@id)
  end

  def create
    movie_data = Imdb::Movie.new(params[:id])
    movie = Movie.new
    movie.title = movie_data.title
    movie.year = movie_data.year
    movie.plot = movie_data.plot
    movie.mpaa_rating = movie_data.mpaa_rating

    if params[:savefave] == "fave"
      movie.rating = 100
    end

    movie.save
    redirect_to '/'
  end

  def saves
    @saves = Movie.all
  end

  def faves
    @faves = Movie.where(rating: 1003)
  end

end



