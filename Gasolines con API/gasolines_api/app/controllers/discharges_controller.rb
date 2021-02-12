class DischargesController < ApplicationController
  before_action :set_discharge, only: [:show, :update, :destroy]

  # GET /discharges
  def index
    @discharges = Discharge.all

    render json: @discharges
  end

  # GET /discharges/1
  def show
    render json: @discharge
  end

  # POST /discharges
  def create
    @discharge = Discharge.new(discharge_params)

    if @discharge.save
      render json: @discharge, status: :created, location: @discharge
    else
      render json: @discharge.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /discharges/1
  def update
    if @discharge.update_attributes(discharge_params)
      render json: @discharge
    else
      render json: @discharge.errors, status: :unprocessable_entity
    end
  end

  # DELETE /discharges/1
  def destroy
    @discharge.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discharge
      @discharge = Discharge.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def discharge_params
      params.require(:discharge).permit(:liters, :date, :station_id, :load_id)
    end
end
