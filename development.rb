require './department.rb'

department_table = Hash.new

puts "Please enter employee data"
puts "Name"
name = gets.chomp
puts "Email"
email = gets.chomp
puts "Phone"
phone = gets.chomp
puts "Salary"
salary = gets.chomp.to_i

employee3 = Employee.new(name: name, email: email, phone: phone, salary: salary)

puts "Which department would you like to add this new employee to?"
employee_department = gets.chomp

Employee_department = Department.new(department_name: employee_department)
Employee_department.add_employee(employee3)
department_table[Employee_department.department_name] = Employee_department.employees
puts department_table

puts "Do you want to enter another record? Enter Y or N."
reenter = gets.chomp

while reenter == "Y" do

  puts "Please enter employee data"
  puts "Name"
  name = gets.chomp
  puts "Email"
  email = gets.chomp
  puts "Phone"
  phone = gets.chomp
  puts "Salary"
  salary = gets.chomp.to_i

  employee3 = Employee.new(name: name, email: email, phone: phone, salary: salary)

  puts "Which department would you like to add this new employee to?"

  employee_department = gets.chomp

  if department_table.any? {|dept_name| dept_name[0] == employee_department} then
    department_table[employee_department] << employee3
  else
    Employee_department = Department.new(department_name: employee_department)
    Employee_department.add_employee(employee3)
    department_table[Employee_department.department_name] = Employee_department.employees
  end

  puts department_table
  puts "Do you want to enter another record? Enter Y or N."
  reenter = gets.chomp
end

puts "Enter the department name to receive total salaries within department."
department_salary = gets.chomp
if department_table.any? {|dept_name| dept_name[0] == department_salary} then
  department_employees_hash = department_table.select {|k,v| k == department_salary}
  department_employees_array = department_employees_hash[department_salary]
  puts "The total salary in the #{department_salary} department is $ #{department_employees_array.collect {|x| x.salary}.inject(0){|sum,x| sum + x }}."
else
  puts "This department doesn't exist."
end

try_again = "Y"
while try_again == "Y" do
  puts "Enter the name of an employee you'd like to review. If not hit any other key."
  employee_name = gets.chomp
  all_employees = department_table.collect {|k,v| v}
  p chosen_employee = all_employees.collect {|x| x.select {|y| y.name == employee_name}}

  puts "Write your review of #{employee_name} below"
  p chosen_employee.collect {|x| x.map {|y| y.add_review_text(gets.chomp)}}
  p chosen_employee

  puts "Please score this employee on a 0 to 1 scale. 1 = great."
  p chosen_employee.collect {|x| x.map {|y| y.add_review_score(gets.chomp.to_f)}}
  p chosen_employee

  puts "Add another review? Y or N"
  try_again = gets.chomp
end

give_raise = "Y"
while give_raise == "Y" do
  puts "Does someone deserve a raise? Enter employee name."
  raise_recipient = gets.chomp
  p chosen_employee = all_employees.collect {|x| x.select {|y| y.name == raise_recipient}}

  puts "Insert how much more you'd like to pay #{raise_recipient}."
  p chosen_employee.collect {|x| x.map {|y| y.ind_raise(gets.chomp.to_i)}}
  p chosen_employee

  puts "Would you like to give out another raise? Enter Y or N?"
  give_raise = gets.chomp
end

puts "Want to give an entire department a raise? Enter department name."
department_salary = gets.chomp
  if department_table.any? {|dept_name| dept_name[0] == department_salary} then
  department_employees_hash = department_table.select {|k,v| k == department_salary}
  department_employees_array = department_employees_hash[department_salary]

  puts "How much for the entire department? Employees with a score greater than 0.49 will equally split the raise."
  department_raise = gets.chomp.to_i
  bonus_recipients = department_employees_array.select {|x| x.score > 0.49}
  bonus_recipients.collect {|x| x.ind_raise(department_raise/bonus_recipients.count)}
  puts "These employees received a raise of #{department_raise/bonus_recipients.count}: #{bonus_recipients}"
else
  puts "That department does not exist."
end
