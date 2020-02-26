class EmployeesController < ApplicationController

    def index
        @employees = Employee.all
    end

    def show
        @employee = current_employee
    end

    def edit
        @employee = current_employee
        @dogs = Dog.all
    end

    def update
        @employee = current_employee
        # byebug
        if @employee.valid?
            @employee.update(employee_params)
            redirect_to @employee
        else
            # flash[:errors] = employee.errors.full_messages
            # byebug
            redirect_to @employee
        end
    end

    def new
        @employee = Employee.new
        @dogs = Dog.all
    end

    def create
        # byebug
        employee = Employee.new(employee_params)
        if employee.valid?
            # byebug
            employee.save
            redirect_to employee
        else
            # flash[:errors] = employee.errors.full_messages
            redirect_to new_employee_path
        end
    end

    private
    
    def current_employee
        Employee.find(params[:id])
    end

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :dog_id)
    end
end
