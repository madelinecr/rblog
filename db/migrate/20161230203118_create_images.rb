class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :title
      t.belongs_to :article, index: true
      t.timestamps
    end
  end
end
