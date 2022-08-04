class WorkspacesLoyalty < ApplicationLoyalty

  def edit?
    user == record || user.admin?
  end

  def update?
    edit?
  end
end
