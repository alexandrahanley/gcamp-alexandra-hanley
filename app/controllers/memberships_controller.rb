class MembershipsController < MarketPagesController
  before_action :set_project, :except => [:index, :new, :create]
  before_action :set_owner, :only => [:update, :edit, :delete]

  def index
    @project = Project.find(params[:project_id])
    @memberships = @project.memberships.all
    @membership = Membership.new
    @owner_of = current_user.owns_project?(@project)
  end

  def create
    @project = Project.find(params[:project_id])
    @membership = Membership.new(membership_params)
    @membership.project_id = @project.id
      if @membership.save
      redirect_to project_memberships_path(@project), notice:"#{@membership.user.full_name}#{" was successfully added"}."
      else
        flash.now[:alert] = @membership.errors.full_messages
        render :index
      end
    end

  def update
    @project = Project.find(params[:project_id])
    @membership = Membership.find(params[:id])
    if @membership.update(membership_params)
      @memberships = @project.memberships

      if @membership.update(role: 1) && @memberships.where(role: 1).count == 1
        redirect_to :back, notice: "Projects must have at least one owner!"
      else
        @memberships.where(role: 1).count == 1
        @membership.update(membership_params)

        redirect_to project_memberships_path(@project),
        notice:"#{@membership.user.full_name}#{" was successfully updated"}."

    end
  end
end

  def destroy
    @project = Project.find(params[:project_id])
    @membership = Membership.find(params[:id])
    @membership.project_id = @project.id
    @membership.destroy
      redirect_to projects_path, notice:
      "#{@membership.user.full_name}#{" was successfully removed"}."
  end

 private

   def set_project
     @project = Project.find(params[:project_id])
     unless @project && @project.users.include?(current_user)
       redirect_to projects_path, notice: 'You do not have access to that project.'
     end
    end

    def set_owner
      unless current_user.owns_project?(@project)
        redirect_to project_path(@project), notice: 'You do not have access.'
      end
    end

  def membership_params
    params.require(:membership).permit(:role, :user_id, :project_id)
  end

end
