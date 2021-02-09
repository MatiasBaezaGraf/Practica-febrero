class ReplacementsController < ApplicationController
  before_action :set_replacement, only: %i[ show edit update destroy ]

  # GET /replacements or /replacements.json
  def index
    if params[:brand_id]
      @replacements = Replacement.where(:brand_id => params[:brand_id]) unless params[:brand_id].blank?
    else
      @replacements = Replacement.all
    end
  end

  # GET /replacements/1 or /replacements/1.json
  def show
  end

  # GET /replacements/new
  def new
    @replacement = Replacement.new
  end

  # GET /replacements/1/edit
  def edit
  end

  # POST /replacements or /replacements.json
  def create
    @replacement = Replacement.new(replacement_params)

    respond_to do |format|
      if @replacement.save
        format.html { redirect_to @replacement, notice: "Replacement was successfully created." }
        format.json { render :show, status: :created, location: @replacement }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @replacement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /replacements/1 or /replacements/1.json
  def update
    respond_to do |format|
      if @replacement.update_attributes(replacement_params)
        format.html { redirect_to @replacement, notice: "Replacement was successfully updated." }
        format.json { render :show, status: :ok, location: @replacement }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @replacement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /replacements/1 or /replacements/1.json
  def destroy
    @replacement.destroy
    respond_to do |format|
      format.html { redirect_to replacements_url, notice: "Replacement was successfully destroyed." }
      format.json { head :no_content }
    end
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
