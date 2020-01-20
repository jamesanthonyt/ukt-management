class TheatresController < ApplicationController
  before_action :set_theatre, only: [:show, :edit, :update, :destroy]

  def index
    @theatres = Theatre.all
  end

  def show; end

  def new
    @theatre = Theatre.new
  end

  def create
    @theatre.create(theatre_params)
    redirect_to theatres_path
  end

  def edit; end

  def update
    @theatre.update(theatre_params)
    redirect_to theatre_path(@@theatre)
  end

  def destroy
    @theatre.destroy
  end

  private

  def set_theatre
    @theatre = Theatre.find([params[:id]])
  end

  def theatre_params
    params.require(:theatre).permit(:name, :managed_by, :af_source_org_id, :notes)
end
