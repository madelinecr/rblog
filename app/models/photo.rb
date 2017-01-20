class Photo < ApplicationRecord
  belongs_to :article, required: false

  has_attached_file :photo, styles: { thumb: "100x100>", standard: "850x350>" }
  validates_attachment_content_type :photo, :content_type => ["image/png"]
end
