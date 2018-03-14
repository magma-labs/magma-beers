require 'rails_helper'

feature 'Admin settings', js: true do
  scenario 'admin can\'t see cancel account section' do
    sign_in(:admin)
    visit "/users/#{User.first.id}/edit"
    expect(page).to have_content("Edit Profile")
    expect(page).to have_no_content("Cancel Account User")
  end

  scenario 'update admin profile' do
    sign_in(:admin)
    visit "/users/#{User.first.id}/edit"
    expect(page).to have_content("Edit Profile")

    fill_in 'user_name', with: FFaker::Name.name
    click_button 'Update'
    expect(page).to have_content("Edit Profile")
    expect(page).to have_content("The user profile has been updated correctly")
  end
end
