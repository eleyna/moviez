class MoviesController < ActionController::Base

  def index
    @movies = Imdb::Search.new(params[:title]).movies
  end

  def show
    @movie_info = Imdb::Movie.new(params[:id])
  end

  def show_faves_saves
    @movie_info = Movie.find(params[:id])
  end

  def create
    movie_data = Imdb::Movie.new(params[:id])
    movie = Movie.new
    movie.title = movie_data.title
    movie.year = movie_data.year
    movie.plot = movie_data.plot
    movie.mpaa_rating = movie_data.mpaa_rating

    movie_data.cast_members[0..2].each do |actor|
      cast_member =  Actor.find_or_create_by_name(actor)
      movie.actors << cast_member
    end

    if params[:savefave] == "fave"
      movie.rating = 100
    end

    movie.save
    redirect_to '/'
  end

  def faves_saves
    if params[:fave_save] == "fave"
      @faves_saves = Movie.where(rating: 100)
    else
      @faves_saves = Movie.all
    end
  end

  def update_movie
    movie = Movie.find(params[:id])

    movie.rating += 1 if params[:rate] == "up"
    movie.rating -= 1 if params[:rate] == "down"

    movie.save

    redirect_to "/movies/saves_faves/#{params[:id]}"
  end

  def show_actors
    @actors = Actor.all
  end

end



