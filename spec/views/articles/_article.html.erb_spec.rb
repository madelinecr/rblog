require 'rails_helper'

describe "articles/_article" do
  before :each do
    @article = create(:article)
    assign(:article, @article)
    render @article
  end

  specify { expect(rendered).to have_content(@article.title) }
  specify { expect(rendered).to have_content(@article.body) }
  specify { expect(rendered).to have_content("Edit") }
  specify { expect(rendered).to have_content("Delete") }
end
