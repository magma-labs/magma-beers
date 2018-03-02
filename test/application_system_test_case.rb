require "test_helper"

ActionDispatch::SystemTestCase.driver
class ActionDispatch::SystemTesting::Driver # :nodoc:
  def register
    return unless [:selenium, :poltergeist, :webkit].include?(@name)

    Capybara.register_driver @name do |app|
      case @name
      when :selenium then register_selenium(app)
      when :poltergeist then register_poltergeist(app)
      when :webkit then register_webkit(app)
      end
    end
  end
end

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  require_relative 'support/capybara'
  driven_by :headless_chrome, :selenium, using: :chrome, screen_size: [1400, 1400]
end
