require 'rails_helper'

RSpec.describe BeerLogsController, type: :controller do

  render_views
  let(:user) { create(:user) }
  let(:beer) { create(:beer) }
  let(:beer_log) { create(:beer_log) }
  subject { beer_log }

  describe "GET index" do
    it "redirects to root path if the user is not logged" do
      get :index
      expect(response.status).to eq(302)
      expect(response).to redirect_to new_user_session_path
    end

    it "returns http success" do
      sign_in user
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      sign_in user
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      sign_in user
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      sign_in user
      get :edit
      expect(response).to have_http_status(:success)
    end
  end
end
