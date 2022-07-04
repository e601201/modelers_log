class StaticPagesController < ApplicationController
  def welcome
    @date = Date.new
  end
end
