class WorkspacesController < ApplicationController
  before_action :set_workspace, only: %i[show edit update destroy]
  skip_before_action :require_login, only: %i[index show new create]

  def index
    @workspaces = Workspace.where.not(id: current_user&.id)
  end

  def show
    @projects = @workspace.projects
  end

  def new
    @workspace = Workspace.new
  end

  def edit; end

  def create
    @workspace = Workspace.new(workspace_params)
    @workspace.owner_name = t('defaults.user.no_name') unless @workspace.owner_name

    if @workspace.save
      redirect_to :workspaces, success: t('defaults.message.created', item: Workspace.model_name.human)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @workspace.update(workspace_params)
      redirect_to @workspace, success: t('defaults.message.updated', item: Workspace.model_name.human)
    else
      flash.now[:error] = t('defaults.message.not_updated', item: Workspace.model_name.human)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
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
