class ProjectsController < MarketPagesController
  before_action :authenticate
  before_action :set_project, :except => [:index, :new, :create]
  before_action :set_owner, :only => [:update, :edit, :destroy]


  def index
    @projects = current_user.projects
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      @membership = Membership.create(user_id: current_user.id, project_id: @project.id, role: 1)
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      @project.memberships.create(role: 1, user_id: current_user.id)
      redirect_to project_tasks_path(@project), notice: 'Project was successfully created.'
    else
      render :new
    end
  end

  def show
    @project =Project.find(params[:id])
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to @project, notice: 'Project was successfully deleted.'
  end

  private

  def set_project
    if @project && @project.users.include?(current_user)
      redirect_to projects_path, notice: 'You do not have access to that project.'
    end
   end

  def set_owner
    unless current_user.owns_project?(@project)
      redirect_to project_path(@project), notice: 'You do not have access.'
    end
  end

  def project_params
    params.require(:project).permit(:name)
  end

end
