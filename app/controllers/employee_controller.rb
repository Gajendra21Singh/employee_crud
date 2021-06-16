class EmployeeController < ApplicationController
#  layout: "test"

  def emp_home
    puts "Params Value = #{params}"
    emp_name = params[:emp_name]
    puts "Employee NAME = #{emp_name}"
    puts "Value = #{emp_name.nil?}"
    @employee = nil
    if emp_name.nil?
      @employees = Employee.all
    else
      @employees = Employee.where(emp_name: emp_name)
    end
    @employee = @employees.first
    puts "Employee Params= #{@employee}"
  end

  def emp_search
    puts "Emp_Search = #{params}"
    emp = params.require(:employee)
    puts "Emp Search = #{emp}"
    emp_name = emp[:name]
    redirect_to action: 'emp_home',emp_name: emp_name
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
        @msg = "Employee Save Successfully"
      else
        puts "validation error"
        @msg = "validation error"
      end
    end

    render partial: "employee/message"
  end

  def employee_search
    puts "Params = #{params}"
    name = params.require(:employee).permit(:emp_name)
    puts "Name = #{name}"
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
    status = Employee.destroy_by(id: id)
    @msg = "Employee are Deleted Successfully"
    render partial: "employee/message"

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
      @msg = "Employee Update Successfully"
    else
      puts "not update"
      @msg = "Employee updating failure"
    end
    render partial: "employee/message"

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
