class DoctorsController < ApplicationController
  def show
    @doctor = doctor_signed_in? ? current_doctor : Doctor.find(params[:id])
    @appointments = @doctor.appointments
  end
end
