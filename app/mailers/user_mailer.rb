class UserMailer < ApplicationMailer
  default from: 'migrant.company@gmail.com'

  def reset_password_email(user)
    @greeting = 'Hi'
    @user = Workspace.find(user.id)
    @url  = edit_password_reset_url(@user.reset_password_token)

    mail to: user.email, subject: t('.success')
  end
end
