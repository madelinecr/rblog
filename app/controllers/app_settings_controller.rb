class AppSettingsController < ApplicationController

  def index
    @app_setting = app_setting
  end

  private
    def app_setting
      if AppSetting.first.nil? then
        @app_setting = AppSetting.new
        @app_setting.title = "RBlog"
        @app_setting.subtitle = "Subtitle"
        return @app_setting
      else
        return AppSetting.first
      end
    end
end
