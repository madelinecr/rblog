require 'rails_helper'

describe "articles/index.html.erb" do

  it "should display the articles" do
    assign(:articles, build_list(:article, 2))
    render
    expect(rendered).to have_css(".article", count: 2)
  end
end
