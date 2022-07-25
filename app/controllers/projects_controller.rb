class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]
  skip_before_action :require_login, only: %i[index show]
  def index
    @projects = Project.all.includes(:workspace)
  end

  def show
    @tasks = @project.tasks
  end

  def new
    @project = Project.new
  end

  def edit; end

  def create
    @project = current_user.projects.build(project_params)

    if @project.save
      redirect_to @project, success: t('defaults.message.created', item: Project.model_name.human)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @project.update(project_params)
      redirect_to @project, success: t('defaults.message.updated', item: Project.model_name.human)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_url, success: t('defaults.message.deleted', item: Workspace.model_name.human), status: :see_other
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :body, :project_image, :state)
  end
end
