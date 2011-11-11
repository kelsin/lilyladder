class GamesController < ApplicationController
  authorize_resource

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
      @game.match = nil
      @match.games -= [@game]
      flash.now[:alert] = 'Error saving game result'
      render :template => 'matches/show'
    end
  end

  def destroy
    @season = Season.find(params[:season_id])
    @round = @season.rounds.find(params[:round_id])
    @match = @round.matches.find(params[:match_id])
    @game = @match.games.find(params[:id])

    if current_user.admin?
      @game.destroy
      @match.check_for_completeness!
      redirect_to [@season, @round, @match], :notice => 'Game removed'
    else
      redirect_to [@season, @round, @match], :alert => 'Only admins can remove games'
    end
  end
end
