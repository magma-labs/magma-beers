# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def weekly_mail(user)
    @user = user
    mail(to: @user.email, subject: 'Weekly report')
  end

  def send_email(options = {})
    @name = options[:name]
    @email = options[:email]
    @message = options[:message]
    mail(to: 'negrete.juan85@gmail.com', subject: 'Amazon SES Email')
  end

end
