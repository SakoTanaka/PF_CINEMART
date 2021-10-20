class HomesController < ApplicationController
  before_action :authenticate_user!, except:[:top ]

  def top
    @movies = Movie.all
  end

end
