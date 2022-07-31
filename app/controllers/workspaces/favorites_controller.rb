class Workspaces::FavoritesController < ApplicationController
  def index
    @workspace = Workspace.find(params[:id])
    @projects = @workspace.favorite_projects
  end
end
