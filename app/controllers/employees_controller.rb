class EmployeesController < ApplicationController
  def index
    render json: { data: @employees = Employee.all }
  end

  def show
  end
end
