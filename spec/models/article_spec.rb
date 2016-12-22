require 'rails_helper'

RSpec.describe Article, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.create(:article)).to be_valid
  end

  it "validates presence of title" do
    expect(subject).to validate_presence_of(:title)
  end

  it "validates presence of body" do
    expect(subject).to validate_presence_of(:body)
  end

  it "validates length of title" do
    expect(subject).to validate_length_of(:title).is_at_least(8)
  end

  # Paperclip
  it "has an attached header" do
    expect(subject).to have_attached_file :header
  end

  it "validates content type of header" do
    expect(subject).to validate_attachment_content_type(:header).allowing("image/png").rejecting("image/jpg")
  end

  describe "body_markdown" do
    it "should return html" do
      article = create(:article)
      article.body = "Lorem ipsum"
      expect(article.body_markdown).to eql("<p>Lorem ipsum</p>\n")
    end
  end
end
