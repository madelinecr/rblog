class Article < ApplicationRecord

  def body_markdown
    Maruku.new(body).to_html
  end
end
