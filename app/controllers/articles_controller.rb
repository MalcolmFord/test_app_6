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
    @article = Article.new
  end

  def edit
    
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    #render plain: @article.inspect
    if @article.save
      flash[:notice] = "You're article was saved successfully"
    redirect_to @article 
    else 
      render 'new'
    end 
  end

  def update
    
  end
end