class AccountsController < ApplicationController
  def update
    if current_user.update_attributes(params[:account])
      redirect_to account_path, :notice => 'Account Updated'
    else
      render :show
    end
  end
end
