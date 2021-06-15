Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'employee#emp_home'
  get 'employee/employee_add'
  get 'employee/emp_add'
  get 'employee/search'
  post 'employee/employee_search'
  get 'employee/edit_page'
  get 'employee/employee_edit'
  post 'employee/employee_update'
  get 'employee/delete_page'
  get 'employee/employee_delete'
end
