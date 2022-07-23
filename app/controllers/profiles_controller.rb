class ProfilesController < ApplicationController
  def show
    @profile = Workspace.find(params[:workspace_id])
  end
end
