require 'rails_helper'

feature 'Admin home', js: true do
  scenario 'Admin can see option admin on left bar' do
    sign_in(:admin)
    visit user_root_path

    expect(page).to have_content("Admin")
  end
end
