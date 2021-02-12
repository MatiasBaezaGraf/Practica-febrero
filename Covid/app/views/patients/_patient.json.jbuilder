json.extract! patient, :id, :first_name, :last_name, :document_number, :birth_date, :province, :city, :status, :created_at, :updated_at
json.url patient_url(patient, format: :json)
