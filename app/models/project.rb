class Project < ApplicationRecord
  belongs_to :division
  has_many :employee_projects
  has_many :employees, :through => :employee_projects
end
