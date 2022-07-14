# Preview all emails at http://localhost:3000/rails/mailers/workspace_mailer
class WorkspaceMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/workspace_mailer/reset_password_email
  def reset_password_email
    WorkspaceMailer.reset_password_email
  end

end
