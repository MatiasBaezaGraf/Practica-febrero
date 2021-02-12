class PlanesController < ApplicationController
  before_action :set_plane, only: [:show, :update, :destroy]

  # GET /planes
  def index
    @planes = Plane.all

    render json: @planes
  end

  # GET /planes/1
  def show
    render json: @plane
  end

  # POST /planes
  def create
    @plane = Plane.new(plane_params)

    if @plane.save
      render json: @plane, status: :created, location: @plane
    else
      render json: @plane.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /planes/1
  def update
    if @plane.update(plane_params)
      render json: @plane
    else
      render json: @plane.errors, status: :unprocessable_entity
    end
  end

  # DELETE /planes/1
  def destroy
    @plane.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plane
      @plane = Plane.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def plane_params
      params.require(:plane).permit(:model, :patent, :brand_id, :airway_id)
    end
end
