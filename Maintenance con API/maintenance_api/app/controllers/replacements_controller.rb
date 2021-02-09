class ReplacementsController < ApplicationController 
  before_action :set_replacement, only: [:show, :update, :destroy]

  # GET /replacements
  def index
    if params[:brand_id]
      @replacements = Replacement.where(:brand_id => params[:brand_id]) unless params[:brand_id].blank?
    else
      @replacements = Replacement.all
    end

    render json: @replacements
  end

  # GET /replacements/1
  def show
    render json: @replacement
  end

  # POST /replacements
  def create
    @replacement = Replacement.new(replacement_params)

    if @replacement.save
      render json: @replacement, status: :created, location: @replacement
    else
      render json: @replacement.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /replacements/1
  def update
    if @replacement.update(replacement_params)
      render json: @replacement
    else
      render json: @replacement.errors, status: :unprocessable_entity
    end
  end

  # DELETE /replacements/1
  def destroy
    @replacement.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_replacement
      @replacement = Replacement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def replacement_params
      params.require(:replacement).permit(:name, :manufacture_date, :serial_number, :brand_id)
    end
end
