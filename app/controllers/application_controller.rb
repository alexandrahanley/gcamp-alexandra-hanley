class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    if session[:user_id]
    @current_user ||= User.find_by(id: session[:user_id])
  end
  end

  def authenticate
    if not current_user
      session[:previous_path] = request.fullpath
      redirect_to signin_path
    end
  end
    helper_method :current_user

    def owns_project?(project)
      project.memberships.find_by(role: Membership.roles[1], user_id: id)
    end
    
  end
