class Admin::ProjectsController < Admin::BaseController
  before_action :set_admin_project, only: %i[show edit update destroy]

  def index
    @admin_projects = Project.all
  end

  def show; end

  def edit; end

  def update
    if @admin_project.update(admin_project_params)
      redirect_to admin_project_path(@admin_project), success: t('defaults.message.updated', item: Project.model_name.human)
    else
      flash.now[:error] = t('defaults.message.not_updated', item: Project.model_name.human)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @admin_project.destroy
    redirect_to admin_projects_url, success: t('defaults.message.deleted', item: Project.model_name.human)
  end

  private

  def set_admin_project
    @admin_project = Project.find(params[:id])
  end

  def admin_project_params
    params.require(:project).permit(:title, :body, :project_image, :project_category, :state)
  end
end
