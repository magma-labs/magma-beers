class DeviseBackgrounder

  def self.confirmation_instructions(record, token, opts = {})
    new(:confirmation_instructions, record, token, opts)
  end

  def self.reset_password_instructions(record, token, opts = {})
    new(:reset_password_instructions, record, token, opts)
  end

  def self.unlock_instructions(record, token, opts = {})
    new(:unlock_instructions, record, token, opts)
  end

  def initialize(method, record, token, opts = {})
    @method, @record, @token, @opts = method, record, token, opts
  end

  def deliver_later
    # You need to hardcode the class of the Devise mailer that you
    # actually want to use. The default is Devise::Mailer.
    Devise::Mailer.delay.send(@method, @record, @token, @opts)
  end

end
