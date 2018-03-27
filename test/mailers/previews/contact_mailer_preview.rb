# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/contact_mailer/contact_us
  def contact_us
    contact = OpenStruct.new(
      name: 'user',
      email: 'user@email.com',
      body: 'This is the body of the email'
    )
    ContactMailer.contact_us contact
  end

end
