class TheatresController < ApplicationController
  before_action :set_theatre, only: [:show, :edit, :update, :destroy]

  def index
    @theatres = Theatre.all
  end

  def show
    @performance_spaces = PerformanceSpace.where(theatre_id: @theatre)
  end

  def new
    @theatre = Theatre.new
  end

  def create
    @theatre = Theatre.new(theatre_params)
    unless @theatre.save
      render :new
    else
      redirect_to theatres_path
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
end
