require 'rails_helper'

feature 'User login', js: true do
  scenario 'user login with invalid user' do
    sign_in_with(FFaker::Internet.email, FFaker::InternetSE.password)
    expect(page).to have_content("Invalid Email or password.")
  end

  scenario 'sign in user and redirect to user root path' do
    sign_in(:user)
    expect(page).to have_current_path(user_root_path)
  end
end
