class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create guest_login]
  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_back_or_to root_path, success: t('.success')
    else
      flash.now[:error] = t('.fail')
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to root_path, success: t('.success')
  end

  def guest_login
    email_account = SecureRandom.uuid
    @workspace = Workspace.create(
      owner_name: 'ゲストユーザー',
      owner_comment: 'ゲストユーザです',
      email: email_account + '@example.com',
      password: 'password',
      password_confirmation: 'password',
      role: :guest
    )
    @workspace.update!(owner_name: "ゲストユーザー_#{@workspace.id}")
    auto_login(@workspace)
    redirect_back_or_to root_path, success: 'ゲストユーザーとしてログインしました'
  end
end
