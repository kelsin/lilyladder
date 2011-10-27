class UsersController < ApplicationController
  authorize_resource

  def show
    @user = User.find(params[:id])
  end
end
