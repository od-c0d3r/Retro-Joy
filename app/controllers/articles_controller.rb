class ArticlesController < ApplicationController

  before_action :logged_in_user

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)

    if params[:article][:image].nil?
      @article.image.attach = url_for('logo.png') 
    else 
      @article.image.attach(params[:article][:image])
    end

    if @article.save
      flash.now[:success] = "Article created!"
      redirect_to article_path(@article.id)
    else
      render new_article_path
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  private

    def article_params
      params.require(:article).permit(:title, :text, :image, :category_id)
    end
end

