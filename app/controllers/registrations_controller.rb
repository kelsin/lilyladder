class RegistrationsController < ApplicationController
  skip_authorization_check

  def create
    @season = Season.find(params[:season_id])
    @season.registrations.create(params[:registration])

    redirect_to season_path(@season)
  end
end
