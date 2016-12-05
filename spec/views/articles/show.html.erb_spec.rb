require 'rails_helper'

describe "articles/show" do

  it "should render the article template" do
    assign(:article, build(:article))
    render
    expect(rendered).to render_template(:partial => "_article")
  end
end
