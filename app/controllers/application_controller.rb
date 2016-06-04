class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  rescue_from CanCan::AccessDenied do |exception|
    # redirect_to root_url, :alert => exception.message
    render :file => "#{Rails.root}/public/403.html", :status => 403, :layout => false
  end

  protected

  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :gender, :email, :password, :password_confirmation)}
  	devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :last_name, :gender, :email, :password, :password_confirmation, :current_password) }
  end

  def after_sign_in_path_for(resource_or_scope)
    # edit_user_registration_url(current_user)
  	edit_user_registration_url(resource)
  end

  # 剛註冊完 "確認信已寄到您的 Email 信箱。請點擊信內連結以啓動您的帳號"
  # def after_inactive_sign_up_path_for(resource)
  #   root_path
  # end

  def after_sign_out_path_for(resource_or_scope)
  	root_url
  end

  def after_update_path_for(resource_or_scope)
    byebug
    faqs_url
  end
end
