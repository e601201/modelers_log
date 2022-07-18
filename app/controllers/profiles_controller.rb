class ProfilesController < ApplicationController
  def show
    @profile = current_user.id
  end

  def edit
  end

  def update
  end
end
