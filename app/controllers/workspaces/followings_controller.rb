class Workspaces::FollowingsController < ApplicationController
  def index
    workspace = Workspace.find(params[:id])
    @workspaces = workspace.followings
  end
end
