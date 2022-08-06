class ApplicationController < ActionController::Base
  include Banken
  protect_from_forgery
  rescue_from Banken::NotAuthorizedError, with: :user_not_authorized
  add_flash_types :success, :info, :warning, :error
  before_action :require_login

  private

  def not_authenticated
    redirect_to login_path, error: t('defaults.message.not_authenticated')
  end

  def user_not_authorized
    flash[:alert] = t('banken.default')
    redirect_to request.referer || root_path
  end
end
