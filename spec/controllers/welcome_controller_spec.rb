require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  describe "GET home" do
    it "renders the home template" do
      get :home
      expect(response).to render_template("home")
    end

    it "routes home to welcome#home" do
      expect(:get => "home").to route_to("welcome#home")
    end
  end

end
