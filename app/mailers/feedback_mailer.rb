class FeedbackMailer < ApplicationMailer
  default to: Admin.first.email

  def send_feedback(feedback, user)
    @user = user
    @subject = feedback.title
    @message = feedback.body

    mail from: @user.email, subject: @subject
  end
end
