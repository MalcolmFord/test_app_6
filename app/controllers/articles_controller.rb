class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @title = @article.title
    @description = @article.description
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
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
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "Article was updated correctly"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      redirect_to articles_path
    end
    
  end
end