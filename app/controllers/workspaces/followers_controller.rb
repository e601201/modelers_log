class Workspaces::FollowersController < ApplicationController
  def index
    @workspace = Workspace.find(params[:id])
    @workspaces = @workspace.followers
  end
end
