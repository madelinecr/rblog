module Helpers
  module SessionHelpers

    def login_admin(admin)
      visit new_admin_session_path
      fill_in "admin_email", with: admin.email
      fill_in "admin_password", with: admin.password
      click_button "Log in"
    end
  end
end
