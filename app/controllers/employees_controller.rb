class EmployeesController < ApplicationController
DB = PG.connect({:dbname => 'employee_tracker_development'})

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
    if @employee.save
      redirect_to division_path(@employee.division)
    else
      render :new
    end
  end

  def edit
    @employee = Employee.find(params[:id])
    @division = @employee.division
    @projects = Project.all
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
    @project = Project.find(params[:project_id])
    @division = @employee.division
    @projects = Project.all
    # binding.pry
    if @project
      distinct_projects = DB.exec("SELECT DISTINCT project_id FROM employee_projects WHERE employee_id = #{@employee.id};")
      distinct = true
      distinct_projects.each do |distinct_project|
        if distinct_project.first[1].to_i == @project.id.to_i
          distinct = false
        end
      end
      if distinct == true
        @employee.projects << @project
      end
      redirect_to employee_path(@employee)
    elsif @employee.update(employee_params)
      redirect_to employees_path
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
