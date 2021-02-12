class FlightsController < ApplicationController
  before_action :set_flight, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /flights or /flights.json
  def index
    if params[:airplane_id]
      @flights = Flight.where(:airplane_id => params[:airplane_id]) unless params[:airplane_id].blank?
    elsif params[:name]
      @flights = Flight.filtername(params[:name])
    elsif params[:company_id]
      @flights = Flight.filtercompany(params[:company_id]) unless params[:company_id].blank?
    elsif params[:airport]
      @flights = Flight.filterairport(params[:airport])
    elsif params[:date]
      @flights = Flight.filterdate(params[:date])
    else
      @flights = Flight.all
    end

    @airplanes = Airplane.all
    
    @state_code = [["Late", 1], ["Landed", 2], ["On Time", 3]]
  end

  # GET /flights/1 or /flights/1.json
  def show
  end

  # GET /flights/new
  def new
    @flight = Flight.new
    @state_code = [["Late", 1], ["Landed", 2], ["On Time", 3]]
  end

  # GET /flights/1/edit
  def edit
    @state_code = [["Late", 1], ["Landed", 2], ["On Time", 3]]
  end

  # POST /flights or /flights.json
  def create
    @flight = Flight.new(flight_params)

    respond_to do |format|
      if @flight.save
        format.html { redirect_to @flight, notice: "Flight was successfully created." }
        format.json { render :show, status: :created, location: @flight }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flights/1 or /flights/1.json
  def update
    respond_to do |format|
      if @flight.update_attributes(flight_params)
        format.html { redirect_to @flight, notice: "Flight was successfully updated." }
        format.json { render :show, status: :ok, location: @flight }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flights/1 or /flights/1.json
  def destroy
    @flight.destroy
    respond_to do |format|
      format.html { redirect_to flights_url, notice: "Flight was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flight
      @flight = Flight.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def flight_params
      params.require(:flight).permit(:departure_date, :arrival_date, :arrival, :name, :state_code, :departure_place, :arrival_place, :airport, :airplane_id)
    end
end
