class TasksController < MarketPagesController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :authenticate

  def index
    @project = Project.find(params[:project_id])
    @tasks = @project.tasks
  end

  def show
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])
    @comment = Comment.new
  end

  def new
    @project = Project.find(params[:project_id])
    @task = Task.new
  end

  def edit
    @task.project_id = params[:project_id]
    @project = Project.find(params[:project_id])
  end

  def create
    @project = Project.find(params[:project_id])
    @task = Task.new(task_params)
    @task.project_id = @project.id
      if @task.save
      redirect_to project_tasks_path(@project), notice: 'Task was successfully created.'
      else
        render :new
      end
    end

  def update
    @task.project_id = params[:project_id]
    @project = Project.find(params[:project_id])

    if @task.update(task_params)
      redirect_to project_path(@task.project_id), notice: "Task was successfully updated!"
    else
      render :edit
  end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @task.project_id = params[:project_id]
    @task.destroy
      redirect_to project_tasks_path(@project), notice: 'Task was successfully destroyed.'
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:description, :date, :complete, :project_id)
    end
end
