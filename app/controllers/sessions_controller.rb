class SessionsController < ApplicationController
  skip_before_filter :authenticate!

  def create
    account = SmfAccount.authenticate(params[:username], params[:password])

    if account
      user = account.user
      session[:user_id] = user.id
      redirect_to root_path
    else
      session[:user_id] = nil
      render :action => :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path
  end
end
