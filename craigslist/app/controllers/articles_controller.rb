class ArticlesController < ApplicationController
  def new
    @category = Category.find(params[:category_id])
    @article = @category.articles.new
    respond_to do |format|
      format.html
      format.json { render json: @article }
      format.js { render 'new'}
    end
  end

  def create
    @category = Category.find(params[:category_id])
    @article = @category.articles.new(article_params)
    @article.user_id = session[:user_id]
    if @article.save
      redirect_to category_path(@category)
    else
      @errors = @article.errors.full_messages
      render 'new'
    end
  end

  def show
    @category = Category.find(params[:category_id])
    @article = Article.find(params[:id])
  end

  private
  def article_params
    params.require(:article).permit(:title, :content)
  end
end
