class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/admin/dashboard'
    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
