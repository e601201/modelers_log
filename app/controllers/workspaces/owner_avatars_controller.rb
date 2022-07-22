class Workspaces::OwnerAvatarsController < ApplicationController
  def destroy
    workspace = Workspace.find(params[:id])
    workspace.owner_avatar.purge
    redirect_to workspace_path(current_user.id),
                notice: t('defaults.message.deleted', item: Workspace.human_attribute_name('owner_avatar')),
                status: :see_other
  end
end
