class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end
#
#   def create
#     @user = User.new(user_params)
#     if @user.save
#       redirect_to users_path
#     else
#       render :new
#   end
# end

def create
  @user = User.new(user_params)

  respond_to do |format|
    if @user.save
      format.html { redirect_to users_path, notice: 'User was successfully created.' }
      format.json { render :show, status: :created, location: @user }
    else
      format.html { render :new }
      format.json { render json: @user.errors, status: :unprocessable_entity }
    end
  end
end



  def edit
  end


  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end

end