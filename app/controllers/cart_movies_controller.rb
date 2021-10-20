class CartMoviesController < ApplicationController
  before_action :authenticate_user!

  def index
    @cart_movies = current_user.cart_movies
  end

  def create
    @cart_movie = CartMovie.new(cart_movie_params)
    @cart_movie.user_id = current_user.id
     if @cart_movie.save
       redirect_to  cart_movies_path
     else
       flash[:notice] = "選択してください"
       @movie = @cart_movie.movie
       @cart_movie = CartMovie.new
       render "movies/show"
     end
  end

  def update
    @cart_movie = CartMovie.find(params[:id])
    @cart_movie.update(cart_movie_params)
    redirect_to cart_movies_path
  end

  def destroy
    @cart_movie = CartMovie.find(params[:id])
    @cart_movie.destroy
    redirect_to cart_movies_path
  end

  def destroy_all
    CartMovie.destroy_all
    redirect_to cart_movies_path
  end

  private

  def cart_movie_params
    params.require(:cart_movie).permit(:movie_id, :user_id, :request)
  end
end
