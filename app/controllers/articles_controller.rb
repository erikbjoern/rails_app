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
  
  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.create(params.require(:article).permit(:title, :content))
    
    if @article.save
      redirect_to @article, notice: "Your article was successfully created."
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(params.require(:article).permit(:title, :content))
      redirect_to @article, notice: "Your changes was successfully saved."
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path, notice: "Your article was successfully deleted."
  end
end