class StaticPagesController < ApplicationController
  skip_before_action :require_login, only: :welcome
  def welcome; end
end
