class ArticlesController < ApplicationController
  protect_from_forgery prepend: true

  def index
    @articles = Article.all
  end

  def list
    before_action :authenticate_user!
    @articles = Article.all
    render 'list'
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    before_action :authenticate_user!
    @article = Article.new
  end

  def edit
    before_action :authenticate_user!
    @article = Article.find(params[:id])
  end

  def create
    before_action :authenticate_user!
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    before_action :authenticate_user!
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    before_action :authenticate_user!
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to admin_articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end

end
