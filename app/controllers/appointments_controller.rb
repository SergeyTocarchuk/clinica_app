class AppointmentsController < ApplicationController
  load_and_authorize_resource
  
  def show
    @appointment = Appointment.find(params[:id])
  end

  def create
    @doctor = Doctor.find(params[:doctor_id])
    @appointment = current_patient.appointments.build(doctor_id: params[:doctor_id])
    if @appointment.save
      redirect_to root_path, notice: "You successfully booked an appointment"
    else
      render 'doctors/show'
      flash.now[:alert] = 'Something went wrong'
    end
  end

  def update
    @appointments = current_patient.appointments
    @appointment = @appointments.find(params[:id])
    @appointment.status = 'closed'
    if @appointment.save
      redirect_to patient_path(current_patient)
      flash.now[:notice] = 'Appointment to Dr. #{@appointment.doctor.name} was cancelled'
    else
      flash.now[:allert] = 'Not cancelled'
    end
  end

  def add_recommendation
    @appointment = current_doctor.appointments.find(params[:appointment_id])
    if @appointment.update(recommendation: params[:appointment][:recommendation], status: 'closed')
      @appointment.photo.attach(params[:appointment][:photo]) if !params[:appointment][:photo].nil?
      redirect_to '/doctors/show'
    else
      render :show
    end
  end
end
