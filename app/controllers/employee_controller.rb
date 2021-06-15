class EmployeeController < ApplicationController
#  layout: "test"
  def emp_home

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
    @emp = Employee.where(emp_name: name[:emp_name]);
  #  puts "NAME = #{@emp}"
    puts "emp = #{@emp}"
    puts "emp size = #{@emp.size}"
    puts "=================="
    @emp.each do |e|
      puts "Name = #{e[:emp_name]}"
      puts "Mobile = #{e[:mobile_no]}"
    end
    puts "===================="
    redirect_to action: 'search'
  end

  def employee_edit
    email = params.require(:employee).permit(:email_id)
    puts "email = #{email}"
    @emp = Employee.find_by(email_id: email[:email_id]);
    puts "Edit emp = #{@emp}"
    print "Name "
    puts @emp[:emp_name]
  end

  def employee_delete
    puts "DELETE = #{params}"
    email = params.require(:employee).permit(:email_id)
    Employee.destroy_by(email_id: email[:email_id])
  end

  def employee_update
    puts "Employee Update"
    puts "params = #{params}"
    permitted = params.require(:employee).permit(:id,:emp_name,:email_id,:mobile_no,:address,:salary)
    emp_id = permitted[:id]
    #puts "emp_id = #{emp_id}"
    emp = Employee.find_by(id: emp_id);
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
