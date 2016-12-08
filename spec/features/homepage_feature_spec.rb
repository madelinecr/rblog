require 'rails_helper'

describe "Home page", :type => :feature do

  before :each do
    visit root_path
  end

  specify { expect(page).to have_content("Sign In") }
  specify { expect(page).to have_content("Register") }
  specify { expect(page).to have_content("About") }
  specify { expect(page).to have_content("Articles") }

  describe "signed in" do
    before :each do
      login_admin(create(:admin))
      visit root_path
    end

    specify { expect(page).to have_content("Sign Out") }
  end

  describe "signed out, user exists" do
    before :each do
      create(:admin)
      visit current_path
    end

    specify { expect(page).to have_no_content("Register") }
  end
end
