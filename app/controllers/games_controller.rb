class GamesController < ApplicationController
  def create
    @season = Season.find(params[:season_id])
    @round = @season.rounds.find(params[:round_id])
    @match = @round.matches.find(params[:match_id])

    redirect_to [@season, @round, @match], :alert => 'Match already complete' if @match.complete?

    @game = @match.games.build(params[:game])

    if @game.save
      @match.check_for_completeness!
      redirect_to [@season, @round, @match], :notice => 'Game result submitted'
    else
      render :controller => 'matches', :action => 'show', :alert => 'Error saving game result'
    end
  end
end
