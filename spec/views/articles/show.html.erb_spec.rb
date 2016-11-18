require 'rails_helper'

describe "articles/show" do
  it "should have an article div" do
    assign(:article, build(:article))
    render
    expect(rendered).to have_css(".article")
  end
end
