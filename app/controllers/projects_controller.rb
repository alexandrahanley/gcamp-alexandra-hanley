class ProjectsController < MarketPagesController
before_action :authenticate

  def index
    @projects = Project.all
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
      redirect_to @project, notice: 'Project was successfully created.'
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

  def project_params
    params.require(:project).permit(:name)
  end

end
