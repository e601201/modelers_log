class Tasks::MoveLowersController < ApplicationController
  def update
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:task_id])
    @task.move_lower
    redirect_to @project
  end
end
