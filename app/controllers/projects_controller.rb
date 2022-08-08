class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]
  skip_before_action :require_login, only: %i[index show]
  def index
    @q = Project.ransack(params[:q])
    @projects = @q.result(distinct: true).includes(:workspace).order(created_at: :desc).page(params[:page])
  end

  def show
    @tasks = @project.tasks
  end

  def new
    @project = Project.new
  end

  def edit
    authorize! @project
  end

  def create
    @project = current_user.projects.build(project_params)

    if @project.save
      redirect_to @project, success: t('defaults.message.created', item: Project.model_name.human)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    authorize! @project
    if @project.update(project_params)
      redirect_to @project, success: t('defaults.message.updated', item: Project.model_name.human)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize! @project
    @project.destroy!
    redirect_to current_user, success: t('defaults.message.deleted', item: Project.model_name.human), status: :see_other
  end

  private

  def set_project
    @project = Project.includes(:workspace).find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :body, :project_image, :project_category, :state)
  end
end
