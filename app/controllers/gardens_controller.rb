class GardensController < ApplicationController
  before_action :set_garden, only: [:show, :destroy, :edit, :update ]
  def new
    @garden = Garden.new
  end

  def create

    @garden = Garden.new(garden_params)
    @garden.user_id = current_user.id
    @garden.save
    redirect_to gardens_path
  end

  def index
    @gardens = Garden.all
  end

  def show
  end

  def destroy
    @garden.destroy
    redirect_to gardens_path
  end

  def edit
  end

  def update
    @garden.user_id = current_user.id
    @garden.update(garden_params)
    redirect_to garden_path(@garden.id)
  end

  private

  def garden_params
    params.require(:garden).permit(:title, :details, :surface, :user_id, :address)
  end

  def set_garden
    @garden = Garden.find(params[:id])
  end
end
