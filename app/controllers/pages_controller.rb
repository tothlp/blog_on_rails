class PagesController < ApplicationController

  protect_from_forgery prepend: true

  def start
    @page = Page.find(1)
    render 'show'
  end

  def index
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    before_action :authenticate_user!
    @page = Page.new
  end

  def edit
    before_action :authenticate_user!
    @page = Page.find(params[:id])
  end

  def create
    before_action :authenticate_user!
    @page = Page.new(page_params)

    if @page.save
      redirect_to @page
    else
      render 'new'
    end
  end

  def update
    before_action :authenticate_user!
    @page = Page.find(params[:id])

    if @page.update(page_params)
      redirect_to @page
    else
      render 'edit'
    end
  end

  def destroy
    before_action :authenticate_user!
    @page = Page.find(params[:id])
    @page.destroy

    redirect_to pages_path
  end

  private
  def page_params
    params.require(:page).permit(:title, :body)
  end
end
