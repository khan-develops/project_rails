class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :line_2
      t.string :city
      t.string :state
      t.string :zipcode
      t.integer :project_id

      t.timestamps
    end
  end
end
