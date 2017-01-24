require 'rails_helper'

RSpec.describe AppSettingsController, type: :controller do

  describe "GET index" do
    let(:app_settings) { create(:app_settings) }
    before :each do
      get :index
    end

    it "renders the index template" do
      expect(response).to render_template("app_settings/index")
    end

    it "assigns @app_settings" do
      expect(assigns(:app_setting)).to be_a(AppSetting)
    end
  end
end
