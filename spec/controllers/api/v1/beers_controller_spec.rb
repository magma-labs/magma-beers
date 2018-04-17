require 'rails_helper'

describe Api::V1::BeersController, type: :controller do

  let(:user) { create(:user) }

  context 'When the user is not logged in' do
    it 'returns an unauthorized message error' do
      get :index, format: :json
      expect(response.status).to eq 401
      expect(response.body).to include('You need to sign in or sign up before continuing.')
    end
  end

  context 'When the user is logged in' do
    before do
      request.headers.merge!(user.create_new_auth_token)
    end
    it 'returns status 200' do
      get :index, format: :json
      expect(response.status).to eq 200
    end
  end
end
