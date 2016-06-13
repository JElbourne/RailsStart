class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  
  helper_method :current_user_subscribed?
  helper_method :current_user_admin?

  def current_user_subscribed?
    user_signed_in? && current_user.subscribed?
  end
  
  def current_user_admin?
    user_signed_in? && current_user.admin
  end

  def temp_action
    render text: nil, layout: true
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:account_update) << :name
  end

  def admin_required
    redirect_to :back, notice: "You can not view this page." unless current_user_admin?
  end
end
