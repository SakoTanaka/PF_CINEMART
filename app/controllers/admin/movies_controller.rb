class Admin::MoviesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @movies = Movie.all
    @movies = Movie.page(params[:page])

  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to admin_movie_path(@movie)
    else
      render :new
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to admin_movie_path(@movie)
    else
      render :edit
    end
  end

  private
   def movie_params
    params.require(:movie).permit(:image, :name, :introduction, :genre_id, :staff, :cast, :releasedate, :copyright, :is_active)
   end

end
