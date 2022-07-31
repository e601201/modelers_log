class FavoritesController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    current_user.favorite(@project)
  end

  def destroy
    @project = current_user.favorites.find(params[:id]).project
    current_user.unfavorite(@project)
  end
end
