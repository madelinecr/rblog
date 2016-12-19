class AddHeaderToArticle < ActiveRecord::Migration[5.0]
  def up
    add_attachment :articles, :header
  end

  def down
    remove_attachment :articles, :header
  end
end
