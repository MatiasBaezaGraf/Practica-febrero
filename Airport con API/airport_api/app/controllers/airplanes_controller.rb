class AirplanesController < ApplicationController
  before_action :set_airplane, only: [:show, :update, :destroy]

  # GET /airplanes
  def index
    if params[:company_id]
      @airplanes = Airplane.where(:company_id => params[:company_id]) unless params[:company_id].blank?
    elsif params[:registration]
      @airplanes = Airplane.where(:registration => params[:registration]) unless params[:registration].blank?
    elsif params[:m_r]
      @airplanes = Airplane.m_r(params[:m_r])
    else
      @airplanes = Airplane.all
    end

    render json: @airplanes
  end

  # GET /airplanes/1
  def show
    render json: @airplane
  end

  # POST /airplanes
  def create
    @airplane = Airplane.new(airplane_params)

    if @airplane.save
      render json: @airplane, status: :created, location: @airplane
    else
      render json: @airplane.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /airplanes/1
  def update
    if @airplane.update(airplane_params)
      render json: @airplane
    else
      render json: @airplane.errors, status: :unprocessable_entity
    end
  end

  # DELETE /airplanes/1
  def destroy
    @airplane.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_airplane
      @airplane = Airplane.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def airplane_params
      params.require(:airplane).permit(:model, :registration, :seatings, :company_id)
    end
end
