class Article < ApplicationRecord

  def body_markdown
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, fenced_code_blocks: true)
    markdown.render(body)
  end
end
