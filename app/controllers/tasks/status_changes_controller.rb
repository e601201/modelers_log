class Tasks::StatusChangesController < ApplicationController
  def update
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:task_id])
    @task.change_state
    redirect_to project_path(@project), success: t('defaults.message.updated', item: Task.model_name.human), status: :see_other
  end
end
