class TheatresController < ApplicationController
  before_action :set_theatre, only: [:show, :edit, :update, :destroy]

  def index
    @theatres = Theatre.all
  end

  def show
    add_breadcrumb '< All Theatres', theatres_path
    @performance_spaces = PerformanceSpace.where(theatre_id: @theatre)
    @af_venues = AfVenue.where(theatre_id: @theatre)
  end

  def new
    @theatre = Theatre.new
  end

  def create
    @theatre = Theatre.new(theatre_params)
    if @theatre.save
      redirect_to theatres_path
    else
      render :new
    end
  end

  def edit; end

  def update
    @theatre.update(theatre_params)
    redirect_to theatre_path(@theatre)
  end

  def destroy
    @theatre.destroy
    redirect_to theatres_path
  end

  private

  def set_theatre
    @theatre = Theatre.find(params[:id])
  end

  def theatre_params
    params.require(:theatre).permit(:name, :managed_by, :af_source_org_id, :notes)
  end

  def theatre_status(theatre)
    'Awaiting perf space details' if theatre.performance_spaces.count.zero?
  end
end
