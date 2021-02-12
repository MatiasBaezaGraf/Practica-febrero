class AirwaysController < ApplicationController
  before_action :set_airway, only: [:show, :update, :destroy]

  # GET /airways
  def index
    @airways = Airway.all

    render json: @airways
  end

  # GET /airways/1
  def show
    render json: @airway
  end

  # POST /airways
  def create
    @airway = Airway.new(airway_params)

    if @airway.save
      render json: @airway, status: :created, location: @airway
    else
      render json: @airway.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /airways/1
  def update
    if @airway.update(airway_params)
      render json: @airway
    else
      render json: @airway.errors, status: :unprocessable_entity
    end
  end

  # DELETE /airways/1
  def destroy
    @airway.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_airway
      @airway = Airway.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def airway_params
      params.require(:airway).permit(:name, :country, :max_planes)
    end
end
