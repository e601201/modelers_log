class Workspaces::FavoritesController < ApplicationController
  skip_before_action :require_login
  def index
    @workspace = Workspace.find(params[:id])
    @projects = @workspace.favorite_projects
  end
end
