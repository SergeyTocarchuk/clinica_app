require 'rails_helper'

describe CategoriesController do
  describe "GET #show" do
    before(:each) do
      @category = FactoryBot.create :category
      get :show, params: { id: @category.id }
    end

    it { should respond_with 200 }
  end

end
