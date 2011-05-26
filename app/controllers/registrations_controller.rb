class RegistrationsController < ApplicationController
  def create
    @season = Season.find(params[:season_id])
    @season.registrations.create(params[:registration])

    redirect_to season_path(@season)
  end
end
