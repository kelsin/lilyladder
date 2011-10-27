class RoundsController < ApplicationController
  authorize_resource

  def create
    @season = Season.find(params[:season_id])
    @round = @season.rounds.create

    redirect_to season_round_path(@season, @round)
  end

  def show
    @season = Season.includes(:registrations => :matches).find(params[:season_id])
    @round = @season.rounds.find(params[:id])
  end
end
