class Admin::BaseController < ApplicationController
  before_action :check_admin

  private

  def not_authenticated
    raise ActionController::RoutingError, 'Not Found'
  end

  def check_admin
    raise ActionController::RoutingError, 'Not Found' unless current_user&.admin?
  end
end
