# frozen_string_literal: true

require 'rails_helper'

describe 'show contact view', type: :feature do
  it 'GET new' do
    sign_in(:user)
    visit new_contact_path
    within('form') do
      expect(page).to have_selector 'input[@type="text"]'
      expect(page).to have_selector 'input[@type="email"]'
      expect(page).to have_selector 'textarea'
      expect(page).to have_selector 'input[@type="submit"]'
    end
  end
end

describe 'submit the contact form', type: :feature do
  it 'POST create' do
    sign_in(:user)
    page.driver.post(
      create_contact_path,
      {
        contact: {
          name: 'Juan Perez',
          email: 'perez@example.org',
          body: 'hai'
        }
      }
    )

    expect(page.current_url).to eq(new_contact_url)

    expect(page).to have_no_content('The message has been sent, thanks!')
  end
end
