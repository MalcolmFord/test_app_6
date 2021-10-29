class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    
    article = Article.find(params[:id])
    @title = article.title
    @description = article.description
  end
end