class Article < ApplicationRecord
  validates_presence_of :title, :body

  validates :title, length: { minimum: 8 }

  has_attached_file :header, styles: { standard: "850x350>" }
  validates_attachment_content_type :header, :content_type => ["image/png"]

  has_many :photos
  accepts_nested_attributes_for :photos, reject_if: proc {|a| a['caption'].blank? }

  def body_markdown
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, fenced_code_blocks: true)
    markdown.render(body)
  end
end
