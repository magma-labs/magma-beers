require 'rails_helper'

RSpec.describe Beer, type: :model do

  let(:beer) { build(:beer) }
  subject { beer }

  it { should be_valid }
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of(:name).ignoring_case_sensitivity }

  describe "Basic model properties" do
	  it { should respond_to(:name) }
	  it { should respond_to(:description) }
	  it { should respond_to(:status) }
	  it { should respond_to(:abv) }
	  it { should respond_to(:ibu) }
	end

end
