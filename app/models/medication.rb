class Medication < ApplicationRecord
  has_many :patient_medications
  has_many :patients, through: :patient_medications
  has_many :patient_diagnoses, through: :patient_medications
end
