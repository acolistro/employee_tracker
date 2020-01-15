require 'rails_helper'

describe EmployeeProject do
  it { should belong_to(:employee) }
  it { should belong_to(:project) }
end
