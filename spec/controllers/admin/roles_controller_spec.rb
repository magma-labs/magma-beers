require 'rails_helper'

describe Admin::RolesController, type: :controller do
  let(:user) { create(:user) }
  let(:admin) { create(:admin) }

  it "redirects to roo path if the user is not an admin" do
    sign_in user
    get :index
    expect(response.status).to eq 302
    expect(response).to redirect_to root_path
  end

  it "allow admins users to visit the admin page" do
    sign_in admin
    get :index
    expect(response.status).to eq 200
  end
end