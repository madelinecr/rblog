require 'rails_helper'

RSpec.describe "articles/_article", type: :view do
  describe "no header" do
    before :each do
      @article = create(:article)
      assign(:article, @article)
      render @article
    end

    specify { expect(rendered).to have_content(@article.title) }
    specify { expect(rendered).to have_content(@article.body) }
    specify { expect(rendered).to_not have_xpath("//img[@src='#{@article.header.url(:standard)}']") }
  end

  describe "header" do
    before :each do
      @article = create(:article_with_header)
      assign(:article, @article)
      render @article
    end

    specify { expect(rendered).to have_xpath("//img[@src='#{@article.header.url(:standard)}']") }
  end
end
