class Admin::WorkspacesController < Admin::BaseController
  before_action :set_admin_workspace, only: %i[show edit update destroy]

  def index
    @admin_workspaces = Workspace.all
  end

  def show; end

  def new
    @admin_workspace = Workspace.new
  end

  def edit; end

  def create
    @admin_workspace = Workspace.new(admin_workspace_params)

    if @admin_workspace.save
      redirect_to @admin_workspace, success: t('defaults.message.created', item: Workspace.model_name.human)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @admin_workspace.update(admin_workspace_params)
      redirect_to admin_workspace_path(@admin_workspace), success: t('defaults.message.updated', item: Workspace.model_name.human)
    else
      flash.now[:error] = t('defaults.message.not_updated', item: Workspace.model_name.human)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @admin_workspace.destroy!
    redirect_to admin_workspaces_url, success: t('defaults.message.deleted', item: Workspace.model_name.human)
  end

  private

  def set_admin_workspace
    @admin_workspace = Workspace.find(params[:id])
  end

  def admin_workspace_params
    params.require(:workspace).permit(:email, :password, :password_confirmation, :owner_name, :owner_comment, :owner_avatar, :role)
  end
end
