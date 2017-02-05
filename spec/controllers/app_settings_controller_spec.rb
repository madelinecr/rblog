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

    it "assigns @app_setting" do
      expect(assigns(:app_setting)).to be_a(AppSetting)
    end

    it "assigns @app_setting.title" do
      expect(assigns(:app_setting).title).to eql("RBlog")
    end

    it "assigns @app_setting.subtitle" do
      expect(assigns(:app_setting).subtitle).to eql("Subtitle")
    end
  end
end
