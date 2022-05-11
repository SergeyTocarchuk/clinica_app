class Patient < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :appointments
  has_many :doctors, through: :appointments

  validates :phone, uniqueness: true

  def email_required?
    false
  end

  def email_changed? 
    false
  end

  def will_save_change_to_email?
    false
  end
end
