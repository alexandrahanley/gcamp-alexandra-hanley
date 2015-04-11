class MembershipsController < MarketPagesController
  before_action :set_project, :except => [:index, :new, :create]


  def index
    @project = Project.find(params[:project_id])
    @memberships = @project.memberships.all
    @membership = Membership.new
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
      redirect_to project_memberships_path(@project),
      notice:"#{@membership.user.full_name}#{" was successfully updated"}."
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

  def membership_params
    params.require(:membership).permit(:role, :user_id, :project_id)
  end

end
