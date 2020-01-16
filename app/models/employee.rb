class Employee < ApplicationRecord
  belongs_to :divisions 
  has_many :employee_projects
  has_many :projects, :through => :employee_projects
end
