# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Contact, type: :model do
  let(:contact) { build(:contact) }
  subject { contact }

  it { should be_valid }

  describe 'Basic model properties' do
    it { should respond_to(:name) }
    it { should respond_to(:email) }
    it { should respond_to(:body) }
  end
end
