class Workspaces::ProfilesController < ApplicationController
  skip_before_action :require_login

  def show
    @profile = Workspace.find(params[:workspace_id])
    @tools = @profile.tools
  end
end
