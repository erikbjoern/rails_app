class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(params.require(:article).permit(:title, :content))
    
    if @article.save
      redirect_to @article, notice: "Your article was successfully created."
    else
      render 'new'
    end
  end
end