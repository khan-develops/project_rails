class CreateDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :details do |t|
      t.string :title
      t.string :role
      t.boolean :completed, default: false
      t.integer :user_id
      t.integer :service_id

      t.timestamps
    end
  end
end
