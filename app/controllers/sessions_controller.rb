class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to pictures_url, notice: "Logged in!"
    else
      flash[:notice] = 'Wrong username/password, try again'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to pictures_url, notice: "Logged out!"
  end
end
