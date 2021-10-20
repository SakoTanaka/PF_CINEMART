class ApplicationController < ActionController::Base

before_action :set_search
def set_search
  #@search = Article.search(params[:q])
  @search = Movie.ransack(params[:q]) #ransackメソッド推奨
  @search_movies = @search.result.page(params[:page])
end

before_action :configure_permitted_parameters, if: :devise_controller?
    # ログイン後の遷移先
  def after_sign_in_path_for(resource)
    case resource
       when User
         root_path
       when Admin
         admin_root_path
    end
  end

 # ログアウト後の遷移先
 def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
       new_admin_session_path
    elsif resource_or_scope == :user
       root_path
    end
 end

 protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :company, :company_name_kana, :department, :postal_code, :address, :telephone_number])
  end

end