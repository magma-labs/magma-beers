class UserMailerPreview < ActionMailer::Preview
  def weekly_mail
    user = OpenStruct.new(email: "demo@example.com", name: "John Doe")
    UserMailer.weekly_mail(user)
  end
end
