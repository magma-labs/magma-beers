require 'rails_helper'

feature 'User settings', js: true do
  scenario 'user can see cancel account section' do
    sign_in(:user)
    visit "/users/#{User.first.id}/edit"
    expect(page).to have_content("Edit Profile")
    expect(page).to have_content("Cancel Account User")
  end

  scenario 'update user settings' do
    sign_in(:user)
    visit "/users/#{User.first.id}/edit"
    expect(page).to have_content("Edit Profile")

    fill_in 'user_name', with: FFaker::Name.name
    click_button 'Update'
    expect(page).to have_content("Edit Profile")
    expect(page).to have_content("The user profile has been updated correctly")
  end

  scenario 'update user settings including password' do
    current_pass = FFaker::InternetSE.password
    new_pass = FFaker::InternetSE.password
    sign_in_with_pass(:user, current_pass)
    visit "/users/#{User.first.id}/edit"
    expect(page).to have_content("Edit Profile")

    fill_in 'user_name', with: FFaker::Name.name
    fill_in 'user_password', with: new_pass
    fill_in 'user_password_confirmation', with: new_pass
    fill_in 'user_current_password', with: current_pass
    click_button 'Update'
    expect(page).to have_content("Edit Profile")
    expect(page).to have_content("The user profile and password have been updated correctly")
  end

  scenario 'update user settings with missing password parameters' do
    new_pass = FFaker::InternetSE.password
    sign_in(:user)
    visit "/users/#{User.first.id}/edit"
    expect(page).to have_content("Edit Profile")

    fill_in 'user_name', with: FFaker::Name.name
    fill_in 'user_password', with: new_pass
    click_button 'Update'
    expect(page).to have_content("Edit Profile")
    expect(page).to have_content("To update password, all password fields must be typed")
  end

  scenario 'update user settings with incorrect current user password' do
    new_pass = FFaker::InternetSE.password
    sign_in(:user)
    visit "/users/#{User.first.id}/edit"
    expect(page).to have_content("Edit Profile")

    fill_in 'user_name', with: FFaker::Name.name
    fill_in 'user_password', with: new_pass
    fill_in 'user_password_confirmation', with: new_pass
    fill_in 'user_current_password', with: FFaker::InternetSE.password
    click_button 'Update'
    expect(page).to have_content("Edit Profile")
    expect(page).to have_content("To update password, the current password filed must match with the password in the database")
  end
end
