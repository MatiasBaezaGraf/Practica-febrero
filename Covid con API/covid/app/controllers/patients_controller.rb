class PatientsController < ApplicationController
  before_action :set_patient, only: %w[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /patients
  # GET /patients.json
  def index
    if params[:status]
      @patients = Patient.where(:status => params[:status]) unless params[:status].blank?
    elsif params[:test_group_id]
      @patients = Patient.where(:test_group_id => params[:test_group_id]) unless params[:test_group_id].blank?
    elsif params[:province] 
      @patients = Patient.where(:province => params[:province]) unless params[:province].blank?
    elsif params[:city]
      @patients = Patient.where("city LIKE ?", "%#{params[:city]}%")
    else
      @patients = Patient.all
    end
    
    @provinces = [["Buenos Aires", 1], ["Catamarca", 2], ["Chaco", 3], ["Chubut", 4], 
    ["Cordoba", 5], ["Corrientes", 6], ["Entre Rios", 7], ["Formosa", 8], ["Jujuy", 9], 
    ["La Pampa", 10], ["La Rioja", 11], ["Mendoza", 12], ["Misiones", 13], ["Neuquen", 14], 
    ["Rio Negro", 15], ["Salta", 16], ["San Juan", 17], ["San Luis", 18], ["Santa Cruz", 19], 
    ["Santa Fe", 20], ["Santiago del Estero", 21], ["Tierra del Fuego", 22], ["Tucuman", 23]]
    @status = [["Isolated", 1], ["Asymptomatic", 2], ["Positive", 3], ["Discharged", 4]]
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
  end

  # GET /patients/new
  def new
    @patient = Patient.new
    @test_groups = Patient.test_size
    @patients = Patient.all
    @status = [["Isolated", 1], ["Asymptomatic", 2], ["Positive", 3], ["Discharged", 4]]
    @provinces = [["Buenos Aires", 1], ["Catamarca", 2], ["Chaco", 3], ["Chubut", 4], 
    ["Cordoba", 5], ["Corrientes", 6], ["Entre Rios", 7], ["Formosa", 8], ["Jujuy", 9], 
    ["La Pampa", 10], ["La Rioja", 11], ["Mendoza", 12], ["Misiones", 13], ["Neuquen", 14], 
    ["Rio Negro", 15], ["Salta", 16], ["San Juan", 17], ["San Luis", 18], ["Santa Cruz", 19], 
    ["Santa Fe", 20], ["Santiago del Estero", 21], ["Tierra del Fuego", 22], ["Tucuman", 23]]
  end

  # GET /patients/1/edit
  def edit
    @test_groups = Patient.test_size
    @patients = Patient.where.not(id: @patient.id)
    @status = [["Isolated", 1], ["Asymptomatic", 2], ["Positive", 3], ["Discharged", 4]]
    @provinces = [["Buenos Aires", 1], ["Catamarca", 2], ["Chaco", 3], ["Chubut", 4], 
    ["Cordoba", 5], ["Corrientes", 6], ["Entre Rios", 7], ["Formosa", 8], ["Jujuy", 9], 
    ["La Pampa", 10], ["La Rioja", 11], ["Mendoza", 12], ["Misiones", 13], ["Neuquen", 14], 
    ["Rio Negro", 15], ["Salta", 16], ["San Juan", 17], ["San Luis", 18], ["Santa Cruz", 19], 
    ["Santa Fe", 20], ["Santiago del Estero", 21], ["Tierra del Fuego", 22], ["Tucuman", 23]]
  end

  # POST /patients
  # POST /patients.json
  def create
    @patient = Patient.new(patient_params)

    respond_to do |format|
      if @patient.save
        format.html { redirect_to @patient, notice: "Patient was successfully created." }
        format.json { render :show, status: :created, location: @patient }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to @patient, notice: "Patient was successfully updated." }
        format.json { render :show, status: :ok, location: @patient }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url, notice: "Patient was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def patient_params
      params.require(:patient).permit(:first_name, :last_name, :document_number, :birth_date, :province, :city, :status, :patient_id, :test_group_id)
    end
end
