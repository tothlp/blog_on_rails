class TagsController < ApplicationController
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def new
    @tag = Tag.new
    @articles = Article.all
  end

  def edit
    @tag = Tag.find(params[:id])
    @articles = Article.all
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to tags_path
    else
      render 'index'
    end
  end

  def update
    @tag = Tag.find(params[:id])

    if @tag.update(tag_params)
      redirect_to tags_path
    else
      render 'index'
    end
  end

  def destroy
    @tag = Tag.find(params[:id])

    # Törölni kell a kapcsolótábla-beli elemeket is
    @tagitem = tag_path
    @tag.destroy


    redirect_to tags_path
  end

  private
  def tag_params
    params.require(:tag).permit(:name, :articles_id => [])
  end

end
