class AddReferencesToChat < ActiveRecord::Migration[7.0]
  def change
    add_reference :chats, :doctor, null: false, foreign_key: true
    add_reference :chats, :patient, null: false, foreign_key: true
  end
end
