class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor

  scope :active, -> { where(status: 'active') }
  scope :closed, -> { where(status: 'closed') }
end
