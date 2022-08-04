class ProjectsLoyalty < ApplicationLoyalty
  def update?
    user.id == record.workspace_id || user.admin?
  end

  def destroy?
    update?
  end
end
