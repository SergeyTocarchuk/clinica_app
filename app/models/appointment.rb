class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor
  has_one_attached :photo

  scope :active, -> { where(status: 'active') }
  scope :closed, -> { where(status: 'closed') }
end
