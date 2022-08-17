class Admin::BaseController < ActionController::Base
  before_action :check_admin

  private

  def check_admin
    raise ActionController::RoutingError.new('Not Found') unless current_user&.admin?
  end
end