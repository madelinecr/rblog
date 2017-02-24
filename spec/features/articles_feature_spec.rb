require 'rails_helper'

describe "Articles", :type => :feature do

  describe "logged out" do
    describe "#index" do
      it "should not have new article link" do
        visit articles_path
        expect(page).to_not have_content("New Article")
      end
    end
    describe "#show" do
      let(:article) { create(:article) }
      it "should not have edit link" do
        visit article_path(article)
        expect(page).to_not have_content("Edit")
      end

      it "should not have destroy link" do
        visit article_path(article)
        expect(page).to_not have_content("Delete")
      end
    end
  end

  describe "logged in as admin" do
    before :each do
      login_admin(create(:admin))
    end

    describe "#index" do
      it "has a new article link" do
        visit articles_path
        expect(page).to have_content("New Article")
      end
    end

    describe "#show" do
      let(:article) { create(:article) }

      it "has an edit article link" do
        visit article_path(article)
        expect(page).to have_content("Edit")
      end

      it "has a delete article link" do
        visit article_path(article)
        expect(page).to have_content("Delete")
      end
    end

    describe "#new" do
      it "creates a new article" do
        visit new_article_path
        within("#form") do
          fill_in "Title", with: "Lorem ipsum dolor sit amet"
          fill_in "Body",  with: "consectetur adipiscing elit"
          attach_file "Header", "spec/factory_image.png"
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
          attach_file "Header", "spec/factory_image2.png"
        end
        click_button 'Update'
        expect(page).to have_content("Success")
      end
    end
  end
end
