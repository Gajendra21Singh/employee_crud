class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string :emp_name
      t.string :email_id
      t.bigint :mobile_no
      t.string :address
      t.float  :salary
      t.timestamps
    end
  end
end
