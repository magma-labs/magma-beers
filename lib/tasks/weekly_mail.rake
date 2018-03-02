desc "Send email to users"

task email_sender: :environment do
  User.find_each do |user|
    UserMailer.weekly_mail(user).deliver
  end
end
