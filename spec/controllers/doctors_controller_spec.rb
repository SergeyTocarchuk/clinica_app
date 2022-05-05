require 'rails_helper'

describe DoctorsController do
  describe "GET #show" do
    before(:each) do
      @doctor = FactoryBot.create :doctor
      get :show, params: { id: @doctor.id }
    end

    it "returns the information about a doctor" do
      expect(response).to eql @doctor.name
    end

    it { should respond_with 200 }
  end
end
