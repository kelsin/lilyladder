class ReplaysController < ApplicationController
  def index
    @season = Season.find(params[:season_id])
    @matches = @season.rounds.map(&:matches).flatten
  end
end
