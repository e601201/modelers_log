class SnsInformationsController < ApplicationController
  before_action :set_sns_information, only: %i[edit update destroy]
  before_action :set_workspace, only: %i[index new]
  def index
    authorize! @workspace
    @sns_informations = @workspace.sns_informations.all
  end

  def new
    authorize! @workspace
    @sns_information = SnsInformation.new
  end

  def create
    @sns_information = current_user.sns_informations.build(sns_information_params)
    authorize! @sns_information
    if @sns_information.save
      redirect_to workspace_sns_informations_path, success: t('defaults.message.created', item: SnsInformation.model_name.human)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize! @sns_information
  end

  def update
    authorize! @sns_information
    if @sns_information.update(sns_information_params)
      redirect_to workspace_sns_informations_path, success: t('defaults.message.updated', item: SnsInformation.model_name.human)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize! @sns_information
    @sns_information.destroy!
    redirect_to workspace_sns_informations_path, success: t('defaults.message.deleted', item: SnsInformation.model_name.human), status: :see_other
  end

  private

  def set_sns_information
    @sns_information = SnsInformation.find(params[:id])
  end

  def set_workspace
    @workspace = Workspace.find(params[:workspace_id])
  end

  def sns_information_params
    params.require(:sns_information).permit(:sns_category, :sns_account)
  end
end
