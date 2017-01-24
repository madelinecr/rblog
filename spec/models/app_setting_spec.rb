require 'rails_helper'

RSpec.describe AppSetting, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.create(:app_setting)).to be_valid
  end

  # Paperclip
  it "has an attached header" do
    expect(subject).to have_attached_file(:topbar)
  end

  it "validates content type of header" do
    expect(subject).to validate_attachment_content_type(:topbar).allowing("image/png").rejecting("image/jpg")
  end
end
