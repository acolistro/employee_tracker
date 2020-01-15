class CreateEmployeeProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :employee_projects, id: false do |t|
      t.belongs_to :employee, index: true
      t.belongs_to :project, index: true
    end
  end
end
