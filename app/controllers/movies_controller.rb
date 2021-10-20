class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    @movies = Movie.where(is_active: true)
    @count = Movie.count
    @movies = Movie.page(params[:page])
  end

  def show
    @movie = Movie.find(params[:id])
    @cart_movie = CartMovie.new
  end
end
