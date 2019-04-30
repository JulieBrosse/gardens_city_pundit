class GardensController < ApplicationController
  before_action :set_garden, only: [:show, :edit, :update ]
  def new
    @garden = Garden.new
    authorize @garden
  end

  def create
    @garden = Garden.new(garden_params)
    authorize @garden
#    authorize @garden, policy_scope_class: GardenPolicy::Myscope   ???

    @garden.user = current_user
# OU :     @garden = current_user.gardens.build(garden_params)

    respond_to do |format|
      if @garden.save
        format.html { redirect_to @garden, notice: 'Garden was successfully created.' }
        format.json { render :show, status: :created, location: @garden }
      else
        format.html { render :new }
        format.json { render json: @garden.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    # REMPLACER PAR
    lat = current_user.latitude
    lon = current_user.longitude
    radius = current_user.search_radius
    @gardens = policy_scope(Garden).near([lat, lon], radius)

  #    @gardens = policy_scope(Garden)
  end

  def my_gardens
    @gardens = GardenPolicy::Scope.new(current_user, Garden).scope.where(user_id: current_user)
  end

  def show
    authorize @garden
  end

  def destroy
    @garden = Garden.find(params[:format])
    authorize @garden
    @garden.destroy
#      format.html { redirect_to my_gardens_path, notice: 'garden was successfully destroyed.' }
#      format.json { head :no_content }
#    else
#      "sorry it was not deleted"
#    end
    redirect_to my_gardens_path
  end

  def edit
    authorize @garden
  end

 def update
  authorize @garden

  respond_to do |format|
    if @garden.update(garden_params)
      format.html { redirect_to @garden, notice: 'Garden was successfully updated.' }
      format.json { render :show, status: :ok, location: @garden }
    else
      format.html { render :edit }
      format.json { render json: @garden.errors, status: :unprocessable_entity }
    end
  end
end

  private

  def garden_params
    params.require(:garden).permit(:title, :details, :surface, :address, :availabilities, :user)
  end

  def set_garden
    @garden = Garden.find(params[:id])
  end
end
