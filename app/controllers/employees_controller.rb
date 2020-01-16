class EmployeesController < ApplicationController

  def index
    @employees = Employee.all
    render :index
  end

  def new
    @employee = Employee.new
    @divisions = Division.all
    render :new
  end

  def create
    @employee = Employee.new(employee_params)
    # binding.pry
    if @employee.save
      redirect_to division_path(@employee.division)
    else
      render :new
    end
  end

  def edit
    @employee = Employee.find(params[:id])
    @division = @employee.division
    render :edit
  end

  def show
    @employee = Employee.find(params[:id])
    @division = @employee.division
    @projects = @employee.projects
    render :show
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update(employee_params)
      redirect_to division_path(@employee.division)
    else
      render :edit
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    redirect_to divisions_path(@division)
  end

  private
  def employee_params
    params.require(:employee).permit(:name, :division_id)
  end
end
