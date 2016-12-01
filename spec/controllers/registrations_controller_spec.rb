require 'rails_helper'

describe RegistrationsController, type: :controller do

  describe "single user registered" do
    before :each do
      @admin = create :admin
      @request.env["devise.mapping"] = Devise.mappings[:admin]
    end

    it "should disallow new admin, redirecting to root path" do
      sign_in @admin
      get :new
      expect(response).to redirect_to(root_path)
    end

    it "should redirect non-signed-in user to sign-in page" do
      get :new
      expect(response).to redirect_to(new_admin_session_path)
    end
  end
end
