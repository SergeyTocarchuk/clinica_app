class AddColumnStatusToAppointment < ActiveRecord::Migration[7.0]
  def change
    add_column :appointments, :status, :string, default: 'active'
  end
end
