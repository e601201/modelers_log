class RelationshipsController < ApplicationController
  def create
    @workspace = Workspace.find(params[:workspace_id])
    @follower = current_user.follow(@workspace)
    current_user.send_notification(@follower)
    redirect_to request.referer || root_path
  end

  def destroy
    @workspace = current_user.followings.find(params[:workspace_id])
    current_user.unfollow(@workspace)
    redirect_to request.referer || root_path, status: :see_other
  end
end
