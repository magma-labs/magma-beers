require 'sidekiq-scheduler'

class WeeklyReminder
  include Sidekiq::Worker

  sidekiq_options queue: :default

  def perform
    User.find_each do |user|
      if user.email != ENV.fetch('MAIL_DEFAULT_ADMIN')
        UserMailer.weekly_mail(user).deliver
      end
    end
  end

end
