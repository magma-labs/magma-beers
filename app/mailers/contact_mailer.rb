# frozen_string_literal: true

class ContactMailer < ApplicationMailer
  def contact_us(message)
    @greeting = 'Hi'
    @body = message.body

    mail(to: ENV.fetch('MAILER_RECEIVER'), from: message.email)
  end
end
