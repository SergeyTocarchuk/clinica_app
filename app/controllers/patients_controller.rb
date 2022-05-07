class PatientsController < ApplicationController
  def show
    @patient = current_patient
    @appointments = @patient.appointments
  end
end
