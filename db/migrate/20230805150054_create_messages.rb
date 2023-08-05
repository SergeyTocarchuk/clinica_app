class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.text :content
      t.references :messageable, polymorphic: true, null: false
      t.references :chat

      t.timestamps
    end
  end
end
