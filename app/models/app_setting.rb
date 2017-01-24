class AppSetting < ApplicationRecord
  has_attached_file :topbar, styles: { standard: "1920x400>" }
  validates_attachment_content_type :topbar, :content_type => ["image/png"]
end
