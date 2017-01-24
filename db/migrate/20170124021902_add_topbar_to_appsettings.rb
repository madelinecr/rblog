class AddTopbarToAppsettings < ActiveRecord::Migration[5.0]
  def up
    add_attachment :app_settings, :topbar
  end

  def down
    remove_attachment :app_settings, :topbar
  end
end
