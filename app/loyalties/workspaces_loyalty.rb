class WorkspacesLoyalty < ApplicationLoyalty
  def update?
    user == record || user.admin?
  end
end
