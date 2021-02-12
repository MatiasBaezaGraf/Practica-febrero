class DischargesController < ApplicationController
  before_action :set_discharge, only: %i[ show edit update destroy ]

  # GET /discharges or /discharges.json
  def index
    @discharges = Discharge.all
  end

  # GET /discharges/1 or /discharges/1.json
  def show
  end

  # GET /discharges/new
  def new
    @discharge = Discharge.new
    @trucks = Truck.all.select { | t | (t.liters_load) > 0 }
  end

  # GET /discharges/1/edit
  def edit
    @trucks = Truck.all.select { | t | (t.liters_load) > 0 }
  end

  # POST /discharges or /discharges.json
  def create
    @discharge = Discharge.new(discharge_params)

    respond_to do |format|
      if @discharge.save
        format.html { redirect_to @discharge, notice: "Discharge was successfully created." }
        format.json { render :show, status: :created, location: @discharge }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @discharge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /discharges/1 or /discharges/1.json
  def update
    respond_to do |format|
      if @discharge.update_attributes(discharge_params)
        format.html { redirect_to @discharge, notice: "Discharge was successfully updated." }
        format.json { render :show, status: :ok, location: @discharge }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @discharge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discharges/1 or /discharges/1.json
  def destroy
    @discharge.destroy
    respond_to do |format|
      format.html { redirect_to discharges_url, notice: "Discharge was successfully destroyed." }
      format.json { head :no_content }
    end
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
