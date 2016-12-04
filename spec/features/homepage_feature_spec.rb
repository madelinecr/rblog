require 'rails_helper'

describe "Home page", :type => :feature do

  before :each do
    visit root_path
  end

  specify { expect(page).to have_content("Sign In") }
  specify { expect(page).to have_content("Register") }
  specify { expect(page).to have_content("About") }
  specify { expect(page).to have_content("Articles") }
  
end
