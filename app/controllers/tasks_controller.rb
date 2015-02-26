class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :authenticate

  def index
    @project = Project.find(params[:project_id])
    @tasks = Task.all
  end

  def show
    @project = Project.find(params[:project_id])
  end

  def new
    @project = Project.find(params[:project_id])
    @task = Task.new
  end

  def edit
  end


  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        render :new
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        redirect_to @task, notice: 'Task was successfully updated.'
        render :show, status: :ok, location: @task
      else
        render :edit
        render json: @task.errors, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @task.destroy

    respond_to do |format|
      redirect_to tasks_url, notice: 'Task was successfully destroyed.'
    end
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:description, :date, :complete, :project_id)
    end
end
