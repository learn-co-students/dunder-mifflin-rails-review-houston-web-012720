class EmployeesController < ApplicationController
    def index 
        @employees = Employee.all 
    end 
    
    def show 
        @employee = Employee.find(params[:id])
    end 
    
    def new
        @dogs = Dog.all
        @employee =Employee.new

    end 
    # def create 
    #     @employee = Employee.new(employee_params)
    #     if !Employee.find_by(title: params[:employee][:title])
    #      @employee.save
    #     redirect_to employee_path(@employee)
    #     else 
    #         redirect_to new_employee_path
    #     end 
    # end 

    def create
        @employee = Employee.new(employee_params)
        if @employee.valid?
            @employee.save
            redirect_to employee_path(@employee)
        else 
            redirect_to new_employee_path
        end 
    end 
    
    def edit
        @dogs = Dog.all
        @employee = Employee.find(params[:id]) 
    end 
    
    
    def update 
        @employee = Employee.find(params[:id]) 
        @employee.update(employee_params) 
        redirect_to employee_path(@employee)
    end 

    def employee_params
        params.require(:employee).permit(:first_name, :last_name,:alias,:title,:office,:imagie,:img_url, :dog_id)
    end 
end
