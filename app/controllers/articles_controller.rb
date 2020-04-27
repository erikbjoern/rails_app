class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

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
    @article = Article.create(article_params)
    
    if @article.save
      redirect_to @article, notice: "Your article was successfully created."
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
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

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end
end