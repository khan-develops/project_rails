class CreateServiceProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :service_projects do |t|
      t.integer :project_id
      t.integer :service_id

      t.timestamps
    end
  end
end
