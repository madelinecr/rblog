class Article < ApplicationRecord
  validates_presence_of :title, :body

  validates :title, length: { minimum: 8 }

  def body_markdown
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, fenced_code_blocks: true)
    markdown.render(body)
  end
end
