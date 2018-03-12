require 'rails_helper'

feature 'User home', js: true do
  scenario 'User can\'t see option admin on the left bar' do
    sign_in(:user)

    expect(page).to have_no_content("Admin")
  end
end
