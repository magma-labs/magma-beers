require 'rails_helper'

describe WeeklyReminder, type: :job do
  it { is_expected.to be_processed_in :default }
end
