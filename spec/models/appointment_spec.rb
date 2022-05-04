require 'rails_helper'

RSpec.describe Appointment, type: :model do
  let(:appointment) { FactoryBot.build :appointment }
  subject { appointment }

  it { should respond_to(:recommendation) }
  it { should respond_to(:patient_id) }
  it { should respond_to(:doctor_id) }  
  
  it { should belong_to(:doctor) }
  it { should belong_to(:patient) }  
end
