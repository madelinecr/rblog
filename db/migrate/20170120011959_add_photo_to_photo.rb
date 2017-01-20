class AddPhotoToPhoto < ActiveRecord::Migration[5.0]
  def up
    add_attachment :photos, :photo
  end

  def down
    remove_attachment :photos, :photo
  end
end
