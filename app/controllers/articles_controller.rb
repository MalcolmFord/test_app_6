class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]
  def index
    @articles = Article.all
  end

  def show
    @title = @article.title
    @description = @article.description
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    #render plain: @article.inspect
    if @article.save
      flash[:notice] = "You're article was saved successfully"
    redirect_to @article 
    else 
      render 'new'
    end 
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article was updated correctly"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    if @article.destroy
      redirect_to articles_path
    end
    
  end

  private

    def find_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :description)
    end
end