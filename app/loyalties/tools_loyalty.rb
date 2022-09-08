class ToolsLoyalty < ApplicationLoyalty
  def create?
    user.id == record.workspace_id || user.admin?
  end

  def new?
    index?
  end

  def update?
    user.id == record.workspace_id || user.admin?
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end
end
