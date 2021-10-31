class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    
    article = Article.find(params[:id])
    @title = article.title
    @description = article.description
  end

  def new

    
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    #render plain: @article.inspect
    @article.save
    redirect_to @article 
  end
end