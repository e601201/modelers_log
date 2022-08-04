class ProjectsLoyalty < ApplicationLoyalty
  def edit?
    user.id == record.workspace_id || user.admin?
  end

  def update?
    edit?
  end
end
