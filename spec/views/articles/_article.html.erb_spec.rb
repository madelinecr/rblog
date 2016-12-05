require 'rails_helper'

describe "articles/_article" do
  before :each do
    @article = build(:article)
    assign(:article, @article)
    render
  end

  specify { expect(rendered).to have_content(@article.title) }
  specify { expect(rendered).to have_content(@article.body) }
end
