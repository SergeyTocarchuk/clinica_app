class Doctor < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :category
  has_many :appointments
  has_many :patients, through: :appointments

  validates :phone, uniqueness: true

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
