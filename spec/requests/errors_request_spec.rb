require 'rails_helper'

describe 'routing errors', type: :request do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  it "404 Error" do
    get "/undefined_route"

    expect(response.status).to eq(404)
  end
end
