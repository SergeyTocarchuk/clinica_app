class DoctorsController < ApplicationController
  def show
    @doctor = Doctor.find(params[:id])
    @appointments = @doctor.appointments if current_doctor.present?
  end
end
