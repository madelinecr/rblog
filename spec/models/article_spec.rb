require 'rails_helper'

RSpec.describe Article, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.create(:article)).to be_valid
  end

  describe "body_markdown(markdown)" do
    it "should return html" do
      article = create(:article)
      article.body = "Lorem ipsum"
      expect(article.body_markdown).to eql("<p>Lorem ipsum</p>\n")
    end
  end
end
