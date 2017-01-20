class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
    @article.photos << Photo.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      flash[:success] = "Success!"
      redirect_to @article
    else
      @article.photos << Photo.new
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      flash[:success] = "Success!"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private
    def article_params
      photos_attributes = [:id, :caption, :photo, :_destroy, :photo_file_name, :photo_content_type,
                           :photo_file_size, :photo_updated_at, :article_id, :created_at, :updated_at]
      params.require(:article).permit(:title, :body, :header, :photo, photos_attributes: photos_attributes)
    end
end
