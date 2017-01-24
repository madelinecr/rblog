class AppSettingsController < ApplicationController

  def index
    @app_setting = app_setting
  end

  private
    def app_setting
      AppSetting.first.nil? ? AppSetting.new : AppSetting.first
    end
end
