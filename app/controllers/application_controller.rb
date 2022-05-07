class ApplicationController < ActionController::Base
  def current_ability
    @current_ability ||= Ability.new(current_user)
  end

  def current_user
    current_patient || current_doctor
  end

  def after_sign_in_path_for(resource)
    doctor_path(current_doctor) if current_doctor.present?
    patient_path(current_patient) if current_patient.present?
  end
end
