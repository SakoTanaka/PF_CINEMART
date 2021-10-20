class ApplicationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @application = Application.new
    @user = current_user
  end

  def info
    @application= Application.new

    @application.media = params[:application] [:media]
    @application.purpose = params[:application] [:purpose]
    @application.date = params[:application] [:date]

    @cart_movies = CartMovie.where(user_id: current_user.id)
    @movie = Movie.where(params[:id])
  end

  def create
    @application= Application.new(application_params)
    @application.user_id = current_user.id
    if @application.save
       @cart_movies = current_user.cart_movies.all
       @cart_movies.each do |cart_movie|
       @application_detail = @application.application_details.new
       @application_detail.movie_id = cart_movie.movie.id
       @application_detail.save
    end
       @cart_movies.destroy_all
       redirect_to applications_thanks_path
    else
       @cart_movies = CartMovie.where(user_id: current_user.id)
       @movie = Movie.where(params[:id])
       render :info
    end
  end

  def thanks
  end

  def index
    @applications = Application.where(user_id: current_user.id)
  end

  def show
    @application = Application.find(params[:id])
    @application_details = ApplicationDetail.where(application_id: params[:id])
  end

  private

  def application_params
    params.require(:application).permit(:purpose, :date, :media)
  end

end