class AuthenticationController < ApplicationController

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      if session[:previous_path]
        redirect_to session[:previous_path]
      else
        redirect_to projects_path
      end
    else
      redirect_to signin_path, notice: "Username / password combination is invalid"
    end

  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
