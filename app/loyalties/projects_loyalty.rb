class ProjectsLoyalty < ApplicationLoyalty
  def update?
    user.id == record.workspace_id || user.admin?
  end
end
