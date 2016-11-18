require 'rails_helper'

describe "articles/new.html.erb" do
  it "should render the form" do
    assign(:article, Article.new)
    render
    expect(rendered).to have_xpath("//form[@class='new_article']")
  end
end
