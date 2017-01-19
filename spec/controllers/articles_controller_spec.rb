require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do

  describe "GET index" do
    let(:articles) { create_list :article, 4 }

    it "renders the index template" do
      get :index
      expect(response).to render_template("articles/index")
    end

    it "assigns @articles" do
      get :index
      expect(assigns(:articles)).to match_array articles
    end
  end

  describe "GET show" do
    let(:article) { create(:article) }
    it "renders the show template" do
      get :show, :params => { :id => article.id }
      expect(response).to render_template("articles/show")
    end

    it "assigns @article" do
      get :show, :params => { :id => article.id }
      expect(assigns(:article)).to be_a(Article)
    end
  end

  describe "GET new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template("articles/new")
    end

    it "assigns @article" do
      get :new
      expect(assigns(:article)).to be_a_new(Article)
    end

    it "initializes @article.photos with single Photo" do
      get :new
      expect(assigns(:article).photos.first).to be_a_new(Photo)
    end
  end

  describe "GET edit" do
    let(:article) { create(:article) }

    before :each do
      get :edit, :params => { :id => article.id}
    end

    it "renders the edit template" do
      expect(response).to render_template("articles/edit")
    end

    it "assigns @article" do
      expect(assigns(:article)).to be_a(Article)
    end
  end

  describe "POST create" do
    describe "on success" do
      let(:params) { attributes_for(:article) }
      it "creates an article" do
        expect { post :create, :params => { article: params }}.to change(Article, :count).by 1
      end

      it "redirects to @article" do
        post :create, :params => { article: params }
        expect(response).to redirect_to(assigns(:article))
      end

      it "sets the flash" do
        post :create, :params => { article: params }
        should set_flash
      end
    end

    describe "on failure" do
      let(:params) { attributes_for(:article, title: nil) }
      it "renders new" do
        post :create, :params => { article: params }
        expect(response).to render_template('articles/new')
      end

      it "builds a photo" do
        post :create, :params => { article: params }
        expect(assigns(:article).photos.first).to be_a_new(Photo)
      end
    end
  end

  describe "PUT update" do
    describe "success" do
      let(:params) do
        { :title => 'new title', :body => 'new body' }
      end
      let(:article) { create(:article) }

      before(:each) do
        put :update, :params => { id: article.id, article: params }
        article.reload
      end

      it { expect(assigns(:article)).to be_a(Article) }
      it { expect(response).to redirect_to(assigns(:article)) }
      it { expect(article.title).to eql params[:title] }
      it { should set_flash }
    end

    describe "failure" do
      let(:params) do
        { :title => 'short', :body => nil }
      end
      let(:article) { create(:article) }

      before :each do
        put :update, :params => { id: article.id, article: params }
        article.reload
      end

      it { expect(assigns(:article)).to be_a(Article) }
      it { expect(response).to render_template('articles/edit')}
    end
  end

  describe "DELETE destroy" do
    before :each do
      @article = create(:article)
    end

    it "assigns @article" do
      delete :destroy, :params => { :id => @article.id }
      expect(assigns(:article)).to be_a(Article)
    end

    it "destroys the article" do
      expect {
        delete :destroy, :params => { :id => @article.id }
      }.to change(Article, :count).by(-1)
    end

    it "redirects to articles_path" do
      delete :destroy, :params => { :id => @article.id }
      expect(response).to redirect_to(articles_path)
    end
  end
end
