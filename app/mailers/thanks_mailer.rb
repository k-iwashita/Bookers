class ThanksMailer < ApplicationMailer
  def creation_email(user)
    @user = user
    mail(
      subject: 'thanks',
      to: user.email,
      from: 'a@a.com'
    )
  end
end
