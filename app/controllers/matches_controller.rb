class MatchesController < ApplicationController
  def create
    @season = Season.find(params[:season_id])
    @round = @season.rounds.find(params[:round_id])

    @round.generate_matches

    redirect_to season_round_path(@season, @round), :notice => 'Matches generated'
  end
end