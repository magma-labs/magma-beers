# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def weekly_mail(user)
    @user = user
    mail(to: @user.email, subject: 'Weekly report')
  end
end
