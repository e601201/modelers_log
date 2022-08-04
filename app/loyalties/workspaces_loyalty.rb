class WorkspacesLoyalty < ApplicationLoyalty
  def update?
    user == record || user.admin?
  end

  def destroy?
    update?
  end
end
