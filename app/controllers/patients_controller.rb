class PatientsController < ApplicationController

  def show
    @patient = patient_signed_in? ? current_patient : Patient.find(params[:id])
    @appointments = @patient.appointments
  end

end
