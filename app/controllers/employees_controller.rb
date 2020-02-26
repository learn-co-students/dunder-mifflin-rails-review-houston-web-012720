class EmployeesController < ApplicationController

  before_action :current_employee, only: [:show, :edit, :update, :destroy]

  def index
    @employees = Employee.all
  end

  def edit
    @dogs = Dog.all
  end

  def update
    @employee.update(strong_params)
    redirect_to employee_path(@employee)
  end

  def destroy
    @employee.destroy
    redirect_to employees_path
  end

  def new
    @dogs = Dog.all
    @employee = Employee.new
  end

  def create
    @employee = Employee.create(strong_params)
    redirect_to employee_path(@employee)
  end

  def show
    
  end

  private

  def current_employee
    @employee = Employee.find(params[:id])
  end

  def strong_params
    params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :dog_id, :img_url)
  end

end
