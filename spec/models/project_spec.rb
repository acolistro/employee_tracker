require 'rails_helper'

describe Project do
  it { should belong_to(:division) }
  it { should have_many(:employees).through(:employee_projects) }
end
