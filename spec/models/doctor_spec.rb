require 'rails_helper'

RSpec.describe Doctor, type: :model do
  let(:doctor) { FactoryBot.build :doctor }
  subject { doctor } 

  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }

  it { should be_valid }

  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should validate_confirmation_of(:password) }
  it { should allow_value('example@domain.com').for(:email) }

  it { should belong_to(:category) }
  it { should have_many(:appointments) } 
  it { should have_many(:patients).through(:appointments) } 
end
