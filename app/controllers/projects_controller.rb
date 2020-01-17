class ProjectsController < ApplicationController
DB = PG.connect({:dbname => 'employee_tracker_development'})

  def index
    @projects = Project.all
    render :index
  end

  def new
    @project = Project.new
    @divisions = Division.all
    render :new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to projects_path(@project.division)
    else
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
    @division = @project.division
    @employees = Employee.all
    render :edit
  end

  def show
    @project = Project.find(params[:id])
    @division = @project.division
    @employees = @project.employees
    render :show
  end

  def update
    @project= Project.find(params[:id])
    @division = @project.division
    @employee = Employee.find(params[:employee_id])
    @employees = Employee.all
    if @employee
      distinct_employees = DB.exec("SELECT DISTINCT employee_id FROM employee_projects WHERE project_id = #{@project.id};")
      distinct = true
      distinct_employees.each do |distinct_employee|
        if distinct_employee.first[1].to_i == @employee.id.to_i
          distinct = false
        end
      end
      if distinct == true
        @project.employees << @employee
      end
      redirect_to project_path(@project)
    elsif @project.update(project_params)
      redirect_to projects_path
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path(@division)
  end

  private
  def project_params
    params.require(:project).permit(:name, :division_id)
  end
end
