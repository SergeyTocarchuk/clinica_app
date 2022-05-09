class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor
  has_one_attached :photo

  scope :active, -> { where(status: 'active') }
  scope :closed, -> { where(status: 'closed') }

  validate :on => :create do
    if doctor.appointments.length >= 10
      errors.add(:appointment, :blank, message: "#{doctor.name} is busy, try later.")
    end
  end
end
