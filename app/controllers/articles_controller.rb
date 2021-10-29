class ArticlesController < ApplicationController

  def show
    
    article = Article.find(params[:id])
    @title = article.title
    @description = article.description
  end
end