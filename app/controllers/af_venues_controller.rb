class AfVenuesController < ApplicationController

  def index
    @theatre = Theatre.find(params[:theatre_id])
    @performance_spaces = @theatre.performance_spaces
    @af_venues = @theatre.af_venues
  end

  # def update
  #   @theatre = Theatre.find(params[:theatre_id])
  #   if @af_venue.update(af_venue_params)
  #     redirect_to theatre_path(@theatre)
  #   else
  #     render :edit
  #   end
  # end
  def map_performance_space
    AfVenue.where(id: params[:venue_ids]).update(performance_space_id: params[:performance_space_id])
  end
end
