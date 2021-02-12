class FlightsController < ApplicationController
  before_action :set_flight, only: [:show, :update, :destroy]

  # GET /flights
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

    render json: @flights
  end

  # GET /flights/1
  def show
    render json: @flight
  end

  # POST /flights
  def create
    @flight = Flight.new(flight_params)

    if @flight.save
      render json: @flight, status: :created, location: @flight
    else
      render json: @flight.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /flights/1
  def update
    if @flight.update(flight_params)
      render json: @flight
    else
      render json: @flight.errors, status: :unprocessable_entity
    end
  end

  # DELETE /flights/1
  def destroy
    @flight.destroy
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
