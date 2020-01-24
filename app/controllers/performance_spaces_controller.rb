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
    assign_grouping(@performance_space)
    if @performance_space.save
      redirect_to theatre_path(@theatre)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @performance_space.update(performance_space_params)
      redirect_to redirect_to theatre_path(@theatre)
    else
      render :edit
    end
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
      :include,
      :notes
    )
  end

  def assign_grouping(performance_space)
    if performance_space.space_type == 'Other' || performance_space.space_type == 'Cinema' || performance_space.space_type == 'Cabaret Space'
      performance_space.grouping = 6
    elsif performance_space.capacity < 200
      performance_space.grouping = 5
    elsif (performance_space.programme.include? 'produced') && performance_space.capacity >= 200
      performance_space.grouping = 4
    elsif (performance_space.programme.include? 'presented') && performance_space.capacity.between?(200, 599)
      performance_space.grouping = 3
    elsif (performance_space.programme.include? 'presented') && performance_space.capacity.between?(600, 999)
      performance_space.grouping = 2
    elsif (performance_space.programme.include? 'presented') && performance_space.capacity >= 1000
      performance_space.grouping = 1
    end
  end
end
