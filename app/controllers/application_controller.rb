class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def logged_in?
    unless current_user
      respond_to do |format|
        format.js { render partial: "shared/login_modal.js" }
      end
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  helper_method :current_user
end
