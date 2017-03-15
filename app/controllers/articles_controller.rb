class ArticlesController < ApplicationController
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @articles = Article.all
  end

  def list
    @articles = Article.all
    render 'list'
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
    @tags = Tag.all
  end

  def edit
    @article = Article.find(params[:id])
    @tags = Tag.all
  end

  def create
    @user = current_user
    @article = Article.new(article_params)
    @article.user_id = @user.id
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to admin_articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :text, :tags_id => [])
    end

end
