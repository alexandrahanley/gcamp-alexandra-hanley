class UsersController < MarketPagesController
  before_action :authenticate
  before_action :set_comembers, :only => [:index, :show]


  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @project = Project.find(params[:id])
  end

  def new
    @user = User.new
  end


  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice: 'User was successfully created.'
    else
      flash.now[:alert] = 'Sorry! Error creating user!'
      render :new
    end
  end


  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end


  def edit
    @user = User.find(params[:id])
    unless current_user == @user
      render :file => "#{Rails.root}/public/404.html",
      :status => 404, :layout => false
    end
  end

  def destroy
    @user = User.find(params[:id])
      @user.destroy
       redirect_to @user, notice: 'User was successfully deleted.'
  end

  private

  def set_comembers
    @comembers = current_user.projects.map{|project| project.users}.flatten
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
