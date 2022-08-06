class Workspaces::FollowersController < ApplicationController
  skip_before_action :require_login
  def index
    @workspace = Workspace.find(params[:id])
    @workspaces = @workspace.followers
  end
end
