class MapsController < ApplicationController
  def create
    @season = Season.includes(:rounds).find(params[:season_id])

    @map_pool = @season.map_pool || @season.create_map_pool

    @map = @map_pool.maps.build(params[:map])

    if @map.save
      redirect_to season_path(@season)
    else
      render :template => 'seasons/show'
    end
  end

  def destroy
    @season = Season.includes(:rounds).find(params[:season_id])
    @season.map_pool.maps.destroy(params[:id]) if @season.map_pool
    redirect_to season_path(@season)
  end
end
