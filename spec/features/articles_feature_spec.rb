require 'rails_helper'

describe "Articles", :type => :feature do

  describe "#new" do
    it "creates a new article" do
      visit "/articles/new"
      within("#form") do
        fill_in "Title", with: "Lorem ipsum dolor sit amet"
        fill_in "Body",  with: "consectetur adipiscing elit"
      end
      click_button 'Create'
      expect(page).to have_content("Success")
    end
  end
end
