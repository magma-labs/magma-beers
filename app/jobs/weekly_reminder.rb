require 'sidekiq-scheduler'

class WeeklyReminder
  include Sidekiq::Worker

  sidekiq_options queue: :default

  def perform
    User.find_each do |user|
      if user.email != 'admin.test.com'
        UserMailer.weekly_mail(user).deliver
      end
    end
  end

end
