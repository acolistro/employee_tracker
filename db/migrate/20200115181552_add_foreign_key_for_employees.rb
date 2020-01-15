class AddForeignKeyForEmployees < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :employees, :divisions
  end
end
