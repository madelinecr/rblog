class CreateAppSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :app_settings do |t|
      t.string :title
      t.string :subtitle
      t.timestamps
    end
  end
end
