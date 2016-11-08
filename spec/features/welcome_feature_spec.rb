require 'rails_helper'

describe "Home page", :type => :feature do

  it "has a sign in link" do
    visit home_path
    expect(page).to have_content("Sign in")
  end

  it "has a register link" do
    visit home_path
    expect(page).to have_content("Register")
  end
end
