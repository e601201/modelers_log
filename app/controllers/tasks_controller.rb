class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]
  before_action :set_projecct, only: %i[show new edit create update destroy]
  skip_before_action :require_login, only: :show

  def show; end

  def new
    authorize! @project
    @task = @project.tasks.new
  end

  def edit
    authorize! @project
  end

  def create
    authorize! @project
    @task = @project.tasks.build(task_params)

    if @task.save
      redirect_to @project, success: t('defaults.message.created', item: Task.model_name.human)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    authorize! @project
    if @task.update(task_params)
      redirect_to @project, success: t('defaults.message.updated', item: Task.model_name.human)
    else
      flash.now[:error] = t('defaults.message.not_updated', item: Task.model_name.human)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize! @project
    @task.destroy!
    redirect_to @task.project, success: t('defaults.message.deleted', item: Workspace.model_name.human), status: :see_other
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def set_projecct
    @project = Project.find(params[:project_id])
  end

  def task_params
    params.require(:task).permit(:title, :body, :task_image, :task_category, :task_state, :project_id)
  end
end
