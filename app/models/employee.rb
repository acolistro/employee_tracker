class Employee < ApplicationRecord
  belongs_to :division
  has_many :employee_projects
  has_many :projects, :through => :employee_projects
end
