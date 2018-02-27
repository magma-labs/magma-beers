require 'rails_helper'

feature 'Managing login', js: true do
  scenario 'user login with invalid user' do
    visit new_user_session_path
    expect(page).to have_content("Log in")
    sleep 3

    fill_in 'user_email', with: 'example@email.com'
    fill_in 'user_password', with: '12345678'
    click_button 'Log in'

    expect(page).to have_content("Invalid Email or password.")
  end
end
