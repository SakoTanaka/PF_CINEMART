class UsersController < ApplicationController
   before_action :authenticate_user!

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path
    else
      flash[:notice] = "値を入力してください。"
      render :edit
    end
  end

  def withdraw
    @user = current_user
  end

  def unsubscribe
    @user = current_user
    @user.update(is_active: false)
    reset_session
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :company, :company_name_kana, :department, :postal_code, :address, :telephone_number, :email)
  end
end
