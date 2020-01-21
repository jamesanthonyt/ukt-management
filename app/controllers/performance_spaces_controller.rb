class PerformanceSpacesController < ApplicationController
  before_action :set_performance_space, except: [:new, :create]

  def index
    @performance_spaces = PerformanceSpace.where(theatre_id: @theatre)
  end

  def show; end

  def new
    @theatre = Theatre.find(params[:theatre_id])
    @performance_space = PerformanceSpace.new
  end

  def create
    @theatre = Theatre.find(params[:theatre_id])
    @performance_space = PerformanceSpace.new(performance_space_params)
    @performance_space.theatre_id = @theatre.id
    @performance_space.save
    redirect_to theatre_path(@theatre)
  end

  def edit; end

  def update
    @performance_space.update(performance_space_params)
    redirect_to theatre_path(@theatre)
  end

  def destroy
    @performance_space.destroy
    redirect_to theatre_path(@theatre)
  end

  private

  def set_performance_space
    @theatre = Theatre.find(params[:theatre_id])
    @performance_space = PerformanceSpace.find(params[:id])
  end

  def performance_space_params
    params.require(:performance_space).permit(
      :name,
      :space_type,
      :capacity,
      :programme,
      :grouping,
      :include,
      :notes
    )
  end
end
