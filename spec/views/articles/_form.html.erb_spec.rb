require 'rails_helper'

describe "articles/_form" do
  it "should have a form for title" do
    assign(:article, build(:article))
    render
    expect(rendered).to have_selector("#article_title")
  end

  it "should have a form for body" do
    assign(:article, build(:article))
    render
    expect(rendered).to have_selector("#article_body")
  end
end
