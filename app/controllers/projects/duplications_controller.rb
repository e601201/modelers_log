class Projects::DuplicationsController < ApplicationController
  def create
    project = current_user.projects.find(params[:project_id])
    clone_project = project.deep_clone include: :tasks
    clone_project.restore_all_state
    clone_project.title += '_clone'
    clone_project.save!
    redirect_to clone_project, success: t('defaults.message.duplicated', item: Project.model_name.human)
  end
end
