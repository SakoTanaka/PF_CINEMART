class Admin::ApplicationsController < ApplicationController
  before_action :authenticate_admin!

  def show
    @application = Application.find(params[:id])
  end

  def update
    application = Application.find(params[:id])
    application.update(application_params)
    application.change_create_status
    redirect_to admin_path
  end

  private
  def application_params
    params.require(:application)
  end
end
