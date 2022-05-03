require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { FactoryBot.build :category }
  subject { category }

  it { should respond_to(:title) }

  it { should be_valid }

  it { should validate_presence_of(:title) }
  it { should validate_uniqueness_of(:title) }
  it { should have_many(:doctors) } 
end
