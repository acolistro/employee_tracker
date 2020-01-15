class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.integer :division_id
      t.integer :project_id
      t.timestamps
    end
  end
end
