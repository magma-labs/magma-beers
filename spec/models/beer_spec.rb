# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Beer, type: :model do
  let(:beer) { build(:beer, photo_remote_url: 'http://www.estucerveza.com/productos/imagenes/img_929_bf5cd22e3afde9fe3827e0c0dfdebe97_1.jpg') }
  subject { beer }

  it { should be_valid }
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of(:name).ignoring_case_sensitivity }

  describe 'Basic model properties' do
    it { should respond_to(:name) }
    it { should respond_to(:description) }
    it { should respond_to(:status) }
    it { should respond_to(:abv) }
    it { should respond_to(:ibu) }
  end
end
