module Features
  module SessionHelpers
    def sign_up_with(email, password)
      visit new_user_registration_path
      fill_in 'user_email', with: email
      fill_in 'user_password', with: password
      click_button 'Sign up'
    end

    def sign_in_with(email, password)
      visit new_user_session_path
      expect(page).to have_content("Log in")
      sleep 3

      fill_in 'user_email', with: email
      fill_in 'user_password', with: password
      click_button 'Log in'
    end

    def sign_in(user_type)
      user = create(user_type)
      visit new_user_session_path
      expect(page).to have_content("Log in")
      sleep 3

      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'Log in'
    end
  end
end