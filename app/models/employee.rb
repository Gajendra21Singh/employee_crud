class Employee < ApplicationRecord
  validates :emp_name,:email_id,:mobile_no,:address,:salary , presence: true
  validates :email_id,:mobile_no, uniqueness: true
  validates :mobile_no, length: {is: 10}
end
