class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :check_category_to_redirect

  helper_method :current_user

  private

  def check_category_to_redirect
    case params[:category][:category_name]
    when "Dog"
      redirect_to dogs_path
    when "Cat"
      redirect_to categories_path, notice: "Please be patient, this option is coming soon."
    end
  end

  def current_user
    check_user
  end

  def check_user
    if params[:user_id]
      session[:id] = params[:user_id]
      session[:new] = true
      current_user = User.find(params[:user_id])
    elsif session[:id]
      current_user = User.find(session[:id])
    end
  end
end
