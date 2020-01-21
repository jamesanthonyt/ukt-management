class PerformanceSpacesController < ApplicationController
  before_action :set_performance_space, only: [:show, :edit, :update, :destroy]

  def index
    @theatre = Theatre.find(params[:theatre_id])
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
    @performance_space.theatre = @theatre
    @performance_space.save
    redirect_to performance_spaces_path
  end

  def edit; end

  def update
    @performance_space.update(performance_space_params)
    redirect_to theatre_path(@performance_space)
  end

  def destroy
    performance_space.destroy
    redirect_to performance_spaces_path
  end

  private

  def set_performance_space
    @performance_space = PerformanceSpace.find(params[:id])
  end

  def theatre_params
    params.require(:performance_space).permit(
      :name,
      :type_other,
      :capacity,
      :programme,
      :grouping,
      :notes
    )
  end
end
