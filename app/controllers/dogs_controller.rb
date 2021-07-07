class DogsController < ApplicationController
  
  before_action :current_dog, only: [:show, :edit, :update, :destroy]

  
  
  def index
    @dogs = Dog.all
  end

  def show
    # byebug
    @employees = Employee.all
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.create(dog_params)
    redirect_to dog_path(@dog)
  end

  def edit

  end

  def update
    @dog.update(dog_params)
    redirect_to dog_path(@dog)
  end

  def destroy
    @dog.destroy
    redirect_to dogs_path
  end

  private

  def current_dog
    @dog = Dog.find(params[:id]) 
  end

  def dog_params
    params.require(:dog).permit(:name, :breed, :age)
  end

end
