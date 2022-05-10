class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor
  has_one_attached :photo

  scope :active, -> { where(status: 'active') }
  scope :closed, -> { where(status: 'closed') }

  validate :check_availability

  def check_availability
    if doctor.appointments.active.length > 2
      errors.add(:appointment, :blank, message: "#{doctor.name} is busy, try later.")
    end
  end
end
