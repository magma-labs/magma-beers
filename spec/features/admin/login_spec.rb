require 'rails_helper'

feature 'Admin login', js: true do
  scenario 'sign in admin and redirect to admin users path' do
    sign_in(:admin)
    expect(page).to have_current_path(admin_users_path)
  end
end
