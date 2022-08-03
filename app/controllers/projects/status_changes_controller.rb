class Projects::StatusChangesController < ApplicationController
  def update
    @project = current_user.projects.find(params[:project_id])
    @project.change_state
    redirect_to project_path(@project), success: t('defaults.message.updated', item: Project.model_name.human), status: :see_other
  end
end
