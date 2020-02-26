class DogsController < ApplicationController

  before_action :current_dog, only: [:show]

  def index
    @dogs = Dog.all.sort{ |a,b|
      b.employees.count <=> a.employees.count
    }
  end

  def show
    
  end

  private

  def current_dog
    @dog = Dog.find(params[:id])
  end
end
