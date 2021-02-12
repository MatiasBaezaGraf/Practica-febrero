class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :update, :destroy]

  # GET /patients
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

    render json: @patients
  end

  # GET /patients/1
  def show
    render json: @patient
  end

  # POST /patients
  def create
    @patient = Patient.new(patient_params)

    if @patient.save
      render json: @patient, status: :created, location: @patient
    else
      render json: @patient.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /patients/1
  def update
    if @patient.update(patient_params)
      render json: @patient
    else
      render json: @patient.errors, status: :unprocessable_entity
    end
  end

  # DELETE /patients/1
  def destroy
    @patient.destroy
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
