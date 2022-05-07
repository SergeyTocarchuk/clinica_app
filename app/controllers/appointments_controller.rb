class AppointmentsController < ApplicationController
  load_and_authorize_resource
  
  def create
    @doctor = Doctor.find(params[:id])
    @appointment = current_patient.appointments.build(doctor_id: @doctor.id)
    if @appointment.save
      redirect_to categories_path, notice: "You successfully booked an appointment"
    else
      render 'show'
      flash.now[:alert] = 'Something went wrong'
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:patient_id, :doctor_id)
  end
end
