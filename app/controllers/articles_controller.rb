class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)

    @article.save
    flash[:success] = "Success!"
    redirect_to @article
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    flash[:success] = "Success!"
    redirect_to @article
  end

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end