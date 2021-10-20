class Admin::HomesController < ApplicationController
 before_action :authenticate_admin!

  def top
    @user = params[:user_id]
    if @user
      @applications = Application.where(user_id: @user)
    else
      @applications = Application.all
    end
  end

end