class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    doctor_ids = @category.doctors.ids
    @doctors = Doctor.find(doctor_ids)
  end
end
