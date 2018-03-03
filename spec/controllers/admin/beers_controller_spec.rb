require 'rails_helper'

describe Admin::BeersController, type: :controller do
  let(:user) { create(:user) }
  let(:admin) { create(:admin) }

  it "redirects to user root path if the user is not an admin" do
    sign_in user
    get :index
    expect(response.status).to eq(302)
    expect(response).to redirect_to user_root_path
  end

  it "allow admins users to visit the admin page" do
    sign_in admin
    get :index
    expect(response.status).to eq 200
  end
end
