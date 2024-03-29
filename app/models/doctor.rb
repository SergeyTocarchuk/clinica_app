class Doctor < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  belongs_to :category
  has_many :appointments
  has_many :patients, through: :appointments

  has_many :messages, as: :messageable

  validates :phone, uniqueness: true

  def email_required?
    false
  end

  def will_save_change_to_email?
    false
  end
end
