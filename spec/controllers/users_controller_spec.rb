require 'rails_helper'

describe UsersController, type: :controller do
  let(:user) { create(:user) }
  let(:new_pass) { FFaker::InternetSE.password }
  let(:user_form_attr) do
    {
      :name => FFaker::Name.name, :password => "",
      :password_confirmation => "", :current_password => ""
    }
  end

  it "On succes update user profile redirect to settings page" do
    sign_in user
    put :update, :params => { :id => user.id, :user => user_form_attr }

    expect(response.status).to eq(302)
    expect(response).to redirect_to edit_user_url
  end
end
