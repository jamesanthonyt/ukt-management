class AfVenuesController < ApplicationController



  def edit
    @theatre = Theatre.find(params[:theatre_id])
    @performance_spaces = @theatre.performance_spaces
    @af_venues = @theatre.af_venues
  end

  def update
    @theatre = Theatre.find(params[:theatre_id])
    if @af_venue.update(af_venue_params)
      redirect_to theatre_path(@theatre)
    else
      render :edit
    end
  end
end
