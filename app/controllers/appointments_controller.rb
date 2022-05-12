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
      redirect_to root_path, alert: "Ooops ... Dr. #{@doctor.name} is not available in the near future, please try later"
    end
  end
  
  def update
    @appointments = current_patient.appointments
    @appointment = @appointments.find(params[:id])
    @appointment.status = 'closed'
    if @appointment.save
      flash[:notice] = "Appointment to Dr. #{@appointment.doctor.name} was cancelled"
      redirect_to patient_path(current_patient)
    else
      flash.now[:allert] = 'Not cancelled, try again'
      render :show
    end
  end

  def add_recommendation
    @doctor = current_doctor
    @appointment = @doctor.appointments.find(params[:appointment_id])
    @appointment.photo.attach(params[:appointment][:photo]) if !params[:appointment][:photo].nil?
    if @appointment.update(recommendation: params[:appointment][:recommendation], status: 'closed')
      flash[:notice] = "Recommendation was successfully created"
      redirect_to doctor_path(@doctor)
    else
      render :show
    end
  end
end
