class SessionsController < ApplicationController
  def new
      render :new
  end

  def create
    user = User.find_by_credential(
      params[:user][:username],
      params[:user][:password])
    if user
      login(user)
      redirect_to user_url(user)
    else
      flash.now[:errors] = ['Invalid Credentials']
      render :new
    end
  end

  def destroy
    log_out
    redirect_to new_sessions_url
  end
end
