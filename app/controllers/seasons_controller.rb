class SeasonsController < ApplicationController
  authorize_resource

  def index
    @seasons = Season.includes(:rounds).all
    @season = Season.new
  end

  def create
    @season = Season.new(params[:season])

    if @season.save
      respond_to do |format|
        format.html { redirect_to seasons_path }
      end
    else
      respond_to do |format|
        @seasons = Season.includes(:rounds).all
        format.html { render :action => :index }
      end
    end
  end

  def show
    @season = Season.includes(:rounds).find(params[:id])
  end
end
