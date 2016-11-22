require 'rails_helper'

describe "Home page", :type => :feature do

  it "has a sign in link" do
    visit home_path
    expect(page).to have_content("Sign In")
  end

  it "has a register link" do
    visit home_path
    expect(page).to have_content("Register")
  end

  it "has an about link" do
    visit home_path
    expect(page).to have_content("About")
  end

  it "has an articles link" do
    visit home_path
    expect(page).to have_content("Articles")
  end
end
