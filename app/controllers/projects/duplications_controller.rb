class Projects::DuplicationsController < ApplicationController
  def create
    project = current_user.projects.find(params[:project_id]).deep_clone include: :tasks
    project.restore_tasks_state
    project.title += '_clone'
    project.save!
    redirect_to project, success: t('defaults.message.duplicated', item: Project.model_name.human)
  end
end
