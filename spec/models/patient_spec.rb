require 'rails_helper'

RSpec.describe Patient, type: :model do
  let(:patient) { FactoryBot.build :patient }
  subject { patient } 

  it { should respond_to(:phone) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }

  it { should be_valid }

  it { should validate_presence_of(:phone) }
  it { should validate_uniqueness_of(:phone).case_insensitive }
  it { should validate_confirmation_of(:password) }
  it { should allow_value('380501234567').for(:phone) }

  it { should have_many(:appointments) }
  it { should have_many(:doctors).through(:appointments) }  
end
