class Article < ApplicationRecord
  include RedcarpetHelper

  validates_presence_of :title, :body

  validates :title, length: { minimum: 8 }

  has_attached_file :header, styles: { standard: "850x350>" }
  validates_attachment_content_type :header, :content_type => ["image/png"]

  has_many :photos
  accepts_nested_attributes_for :photos,
                                allow_destroy: true,
                                reject_if: proc {|a| a['caption'].blank? }

  def body_markdown
    options = { fenced_code_blocks: true }
    #markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, options)
    renderer = markdown(options)
    renderer.render(body)
  end

  def paragraph
    body_markdown.scan(/<p>(.*)<\/p>/)[0][0]
  end
end
