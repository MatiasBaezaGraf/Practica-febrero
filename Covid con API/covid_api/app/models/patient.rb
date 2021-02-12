class Patient < ActiveRecord::Base
	belongs_to :test_group
	has_many :infected, class_name: 'Patient', foreign_key: :patient_id
	belongs_to :infectant, optional: true, class_name: 'Patient', foreign_key: :patient_id
	delegate :document_number, :first_name, 
     to: :infectant, 
     prefix: true,
     allow_nil: true
end
