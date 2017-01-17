require './employee.rb'

class Department
  def initialize(department_name:)
    @department_name = department_name
    @employees = []
  end

  def department_name
    @department_name
  end

  def add_employee(a)
    @employees << a
  end

  def employees
    @employees
  end
end
