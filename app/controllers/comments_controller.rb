class CommentsController < ApplicationController

  def create
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:task_id])
    @comment = Comment.new(comment_params)
    @comment.task_id = @task.id
    @comment.user_id = current_user.id
      if @comment.save
      redirect_to project_task_path(@project, @task), notice: 'Comment was successfully created.'
      else
        render :index
      end
    end

  private

    def comment_params
      params.require(:comment).permit(:description, :created_at, :user_id, :task_id)
    end

end
