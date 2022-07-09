class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'  # TODO: Set this as an environment setting.

  def weekly_digest
    @user = params[:user]
    mail(to: @user.email, subject: 'Your weekly digest from the chat room' )
  end
end
