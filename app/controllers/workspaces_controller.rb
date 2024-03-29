class WorkspacesController < ApplicationController
  before_action :set_workspace, only: %i[show edit update destroy]
  skip_before_action :require_login, only: %i[index show new create]

  def index
    @q = Workspace.ransack(params[:q])
    @workspaces = @q.result(distinct: true).includes(:projects).order(created_at: :desc).page(params[:page])
  end

  def show
    @q = @workspace.projects.ransack(params[:q])
    @projects = @q.result(distinct: true).includes([:workspace, :tasks, :project_image_attachment]).page(params[:page])
  end

  def new
    @workspace = Workspace.new
  end

  def edit
    authorize! @workspace
  end

  def create
    @workspace = Workspace.new(workspace_params)
    @workspace.owner_name = t('defaults.user.no_name') unless @workspace.owner_name

    if @workspace.save
      auto_login(@workspace)
      redirect_to root_path, success: t('defaults.message.created', item: Workspace.model_name.human)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    authorize! @workspace

    if @workspace.update(workspace_params)
      redirect_to @workspace, success: t('defaults.message.updated', item: Workspace.model_name.human)
    else
      flash.now[:error] = t('defaults.message.not_updated', item: Workspace.model_name.human)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize! @workspace
    @workspace.destroy!
    redirect_to root_path, success: t('defaults.message.deleted', item: Workspace.model_name.human), status: :see_other
  end

  private

  def set_workspace
    @workspace = Workspace.find(params[:id])
  end

  def workspace_params
    params.require(:workspace).permit(:email, :password, :password_confirmation, :owner_name, :owner_comment, :owner_avatar, :role)
  end
end
