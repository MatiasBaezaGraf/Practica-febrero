class AirwaysController < ApplicationController
  before_action :set_airway, only: %i[ show edit update destroy ]

  # GET /airways or /airways.json
  def index
    @airways = Airway.all
  end

  # GET /airways/1 or /airways/1.json
  def show
  end

  # GET /airways/new
  def new
    @airway = Airway.new
  end

  # GET /airways/1/edit
  def edit
  end

  # POST /airways or /airways.json
  def create
    @airway = Airway.new(airway_params)

    respond_to do |format|
      if @airway.save
        format.html { redirect_to @airway, notice: "Airway was successfully created." }
        format.json { render :show, status: :created, location: @airway }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @airway.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /airways/1 or /airways/1.json
  def update
    respond_to do |format|
      if @airway.update(airway_params)
        format.html { redirect_to @airway, notice: "Airway was successfully updated." }
        format.json { render :show, status: :ok, location: @airway }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @airway.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /airways/1 or /airways/1.json
  def destroy
    @airway.destroy
    respond_to do |format|
      format.html { redirect_to airways_url, notice: "Airway was successfully destroyed." }
      format.json { head :no_content }
    end
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
