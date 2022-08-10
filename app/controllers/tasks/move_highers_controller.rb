class Tasks::MoveHighersController < ApplicationController
  def update
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:task_id])
    @task.move_higher
    redirect_to @project
  end
end
