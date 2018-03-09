require 'rails_helper'

RSpec.describe BeersController, type: :controller do
  render_views
  let(:user) { create(:user) }
  let(:beer) { create(:beer) }
  subject { beer }

  describe "GET index" do
    it "redirects to root path if the user is not logged" do
      get :index
      expect(response.status).to eq(302)
      expect(response).to redirect_to new_user_session_path
    end

    it "allow logged users to visit the page" do
      sign_in user
      get :index
      expect(response.status).to eq 200
    end

    it "has a 200 status code" do
      sign_in user
      get :index
      expect(response.status).to eq(200)
    end

    it "populates an array of beers" do
      sign_in user
      beer = create(:beer)
      get :index
      expect(assigns(:beers)).to eq([beer])
    end
  end

  describe "GET #show" do
    it "assigns the requested beer to @beer" do
      sign_in user
      beer = create(:beer)
      get :show, params: { id: beer.id }
      expect(assigns(:beer)).to eq(beer)
    end

    it "renders the :show template" do
      sign_in user
      get :show, params: { id: beer.id }
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    it "assigns a new Beer to @beer" do
      sign_in user
      get :new
      expect(assigns(:beer)).to be_a_new(Beer)
    end

    it "renders the :new template" do
      sign_in user
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new contact in the database" do
        sign_in user
        expect { post :create, params: { beer: attributes_for(:beer) }}.to change(Beer, :count).by(1)
      end

      it "redirects to beers#show" do
        sign_in user
        post :create, params: { beer: attributes_for(:beer) }
        expect(response).to redirect_to beer_path(assigns(:beer))
      end
    end

    context "with invalid attributes" do
      it "does not save the new beer in the database" do
        sign_in user
        expect{
          post :create,
            params: { beer: { name: 'name' } }
        }.not_to change(Beer, :count)
      end

      it "re-renders the :new template" do
        sign_in user
        post :create,
          params: { beer: { name: 'name' } }
        expect(response).to render_template :new
      end
    end
  end
end
