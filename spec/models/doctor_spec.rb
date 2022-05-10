require 'rails_helper'

RSpec.describe Doctor, type: :model do
  let(:doctor) { FactoryBot.build :doctor }
  subject { doctor } 

  it { should respond_to(:phone) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }

  it { should be_valid }

  it { should validate_presence_of(:phone) }
  it { should validate_uniqueness_of(:phone) }
  it { should validate_confirmation_of(:password) }
  it { should allow_value('380501234567').for(:phone) }

  it { should belong_to(:category) }
  it { should have_many(:appointments) } 
  it { should have_many(:patients).through(:appointments) } 
end
