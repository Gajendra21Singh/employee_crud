class EmployeeController < ApplicationController
#  layout: "test"

  def emp_home
    @employee = Employee.all
    puts "Employee Params= #{@employee}"
  end

  def employee_add
    puts "============================="
    puts "Params = #{params}"
    emp = params[:employee]
    #puts "Employe = #{emp}"
    #puts "Required = #{params.require(:employee)}"
    permitted = params.require(:employee).permit(:emp_name,:email_id,:mobile_no,:address,:salary)
    if permitted.permitted?
      emp = Employee.create(emp_name:permitted[:emp_name],email_id:permitted[:email_id],mobile_no:permitted[:mobile_no],
      address:permitted[:address],salary:permitted[:salary]).valid?
      if emp == true
        puts "Employee Save Successfully"
      else
        puts "validation error"
      end
    end
  end

  def employee_search
    #puts "Params = #{params}"
    name = params.require(:employee).permit(:emp_name)
    #puts "Name = #{name}"
    @employee = Employee.where(emp_name: name[:emp_name]);
    puts "NAME = #{@employee}"
    puts "emp = #{@employee}"
    puts "emp size = #{@employee.size}"
    puts "=================="
    @employee.each do |e|
      puts "Name = #{e[:emp_name]}"
      puts "Mobile = #{e[:mobile_no]}"
    end
    puts "===================="
  end

  def employee_edit
    id = params.require(:id)
    @emp = Employee.find_by(id: id);
  end

  def employee_delete
    puts "DELETE = #{params}"
    id = params.require(:id)
    puts "ID = #{id}"
    Employee.destroy_by(id: id)
  end

  def employee_update
    puts "Employee Update"
    puts "params = #{params}"
    permitted = params.require(:employee).permit(:id,:emp_name,:email_id,:mobile_no,:address,:salary)
    id = permitted[:id]
    #puts "emp_id = #{emp_id}"
    emp = Employee.find_by(id: id);
    emp[:email_id] = permitted[:email_id]
    emp[:address] = permitted[:address]
    emp[:salary] = permitted[:salary]
    emp[:mobile_no] = permitted[:mobile_no]
    if emp.save
      puts "Employee Update Successfully"
    else
      puts "not update"
    end

  end
  def emp_add

  end
  def search

  end
  def edit_page

  end

  def delete_page

  end
end
