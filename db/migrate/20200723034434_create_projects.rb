class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.date :start_date
      t.boolean :started, default: false
      t.boolean :completed, default: false
      t.integer :user_id

      t.timestamps
    end
  end
end
