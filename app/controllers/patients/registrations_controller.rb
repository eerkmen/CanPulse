class Patients::RegistrationsController < ApplicationController
  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      session[:patient_id] = @patient.id
      redirect_to dashboard_path 
    else
      render 'new'
    end
  end

  private

  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :email, :date_of_birth, :address, :password, :password_confirmation)
  end
end
