require 'rails_helper'

describe "Articles", :type => :feature do

  before :each do
    login_admin(create(:admin))
  end

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

  describe "#edit" do
    it "edits an article" do
      article = create(:article)
      visit edit_article_path(article.id)
      within("#form") do
        fill_in "Title", with: "Edited title"
        fill_in "Body",  with: "Edited body"
      end
      click_button 'Update'
      expect(page).to have_content("Success")
    end
  end
end
