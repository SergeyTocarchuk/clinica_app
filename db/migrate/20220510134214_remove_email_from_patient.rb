class RemoveEmailFromPatient < ActiveRecord::Migration[7.0]
  def change
    remove_column :patients, :email, :string
  end
end
