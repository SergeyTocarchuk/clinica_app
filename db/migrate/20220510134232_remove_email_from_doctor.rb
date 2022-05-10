class RemoveEmailFromDoctor < ActiveRecord::Migration[7.0]
  def change
    remove_column :doctors, :email, :string
  end
end
