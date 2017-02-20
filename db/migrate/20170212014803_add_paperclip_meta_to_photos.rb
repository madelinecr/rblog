class AddPaperclipMetaToPhotos < ActiveRecord::Migration[5.0]
  def change
    add_column :photos, :file_meta, :text
  end
end
