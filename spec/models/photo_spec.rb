require 'rails_helper'

RSpec.describe Photo, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.create(:photo)).to be_valid
  end

  it "belongs to article" do
    expect(subject).to belong_to(:article)
  end

  # Paperclip
  it "has an attached photo" do
    expect(subject).to have_attached_file :photo
  end

  it "validates content type of header" do
    expect(subject).to validate_attachment_content_type(:photo).allowing("image/png").rejecting("image/jpg")
  end
end
