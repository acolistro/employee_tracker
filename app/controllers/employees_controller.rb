class EmployeesController < ApplicationController

  def index
    @employees = Employee.all
    render :index
  end

  def new
    @division = Division.find(params[:division_id])
    @employee = @division.employees.new
    @divisions = Division.all
    render :new
  end

  def create
    @divisions = Division.all
    @division = Division.find(params[:division_id])
    @employee = @division.employees.new(employee_params)
    binding.pry
    if @employee.save
      redirect_to division_path(@division)
    else
      render :new
    end
  end

  def edit
    @division = Division.find(params[:division_id])
    @employee = Employee.find(params[:id])
    render :edit
  end

  def show
    @division = Division.find(params[:division_id])
    @employee = Employee.find(params[:id])
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
    redirect_to division_path(@employee.division)
  end

  private
  def employee_params
    params.require(:employee).permit(:name, :division_id)
  end
end
