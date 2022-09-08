class ToolsController < ApplicationController
  before_action :set_tool, only: %i[edit update destroy]
  def new
    @workspace = Workspace.find(params[:workspace_id])
    @tool = @workspace.tools.new
    authorize! @tool
  end

  def create
    authorize! @tool
    @tool = current_user.tools.build(tool_params)
    if @tool.save
      redirect_to workspace_profile_path(current_user), success: t('defaults.message.created', item: Tool.model_name.human)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize! @tool
    @workspace = Workspace.find(params[:workspace_id])
  end

  def update
    authorize! @tool
    if @tool.update(tool_params)
      redirect_to workspace_profile_path(current_user), success: t('defaults.message.updated', item: Tool.model_name.human)
    else
      flash.now[:error] = t('defaults.message.not_updated', item: Tool.model_name.human)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize! @tool
    @tool.destroy!
    redirect_to workspace_profile_path, success: t('defaults.message.deleted', item: Tool.model_name.human), status: :see_other
  end

  private

  def set_tool
    @tool = Tool.find(params[:id])
  end

  def tool_params
    params.require(:tool).permit(:name, :body, :tool_category)
  end
end
