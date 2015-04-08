class AboutController < ApplicationController

  def index
    @projects = Project.all
    @tasks = Task.all
    @users = User.all
    @memberships = Membership.all
    @comments = Comment.all
  end
end
