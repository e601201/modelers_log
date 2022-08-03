class Projects::StatusChangesController < ApplicationController
  def create
    @project = current_user.projects.find(params[:project_id])
    @project.done!
    redirect_to @project, success: t('defaults.message.updated', item: Project.model_name.human)
  end

  def destroy
    @project = current_user.projects.find(params[:project_id])
    @project.in_progress!
    redirect_to @project, success: t('defaults.message.updated', item: Project.model_name.human), status: :see_other
  end
end
