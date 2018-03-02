require 'rails_helper'

feature 'Managing login', js: true do
  scenario 'sign in admin and redirec to admin users path' do
    sign_in(:admin)
    expect(page).to have_current_path(admin_users_path)
  end

  scenario 'sign in user and redirec to user root path' do
    sign_in(:user)
    expect(page).to have_current_path(user_root_path)
  end

  scenario 'user login with invalid user' do
    sign_in_with(FFaker::Internet.email, FFaker::InternetSE.password)
    expect(page).to have_content("Invalid Email or password.")
  end
end
