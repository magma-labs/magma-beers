require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { build(:user) }
  subject { user }

  it { should be_valid }
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }

  describe "Basic model properties" do
	  it { should respond_to(:email) }
	  it { should respond_to(:name) }
	  it { should respond_to(:password) }
	  it { should respond_to(:password_confirmation) }
	end

end
