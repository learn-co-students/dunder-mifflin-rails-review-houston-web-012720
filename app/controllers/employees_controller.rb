class EmployeesController < ApplicationController
  
  before_action :current_employee, only: [:show, :edit, :update, :destroy]
  
  def index
    @employees = Employee.all 
  end

  def show
    @dogs = Dog.all
  end

  def new
    @dogs = Dog.all
    @employee = Employee.new
  end

  def create
    employee = Employee.new(employee_params)
    # byebug
    if employee.valid? 
      # byebug 
      employee.save
      redirect_to employee_path(employee)
    else
      # byebug
      flash[:errors] = employee.errors.full_messages
      redirect_to new_employee_path
    end
  end

  def edit
    @dogs = Dog.all
  end

  def update
    @employee.update(employee_params)
    redirect_to employee_path(@employee)
  end

  def destroy

    @employee.destroy
    redirect_to employees_path
    flash[:notice] = "Employee Fired!"
  end

  private

  def current_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
    # byebug
  end
end
