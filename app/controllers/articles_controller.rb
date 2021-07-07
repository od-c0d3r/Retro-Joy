class ArticlesController < ApplicationController


  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)
    @article.image.attach(params[:article][:image])
    if @article.save
      flash[:success] = "Article created!"
      redirect_to article_path(@article.id)
    else
      render 'appliction/main'
    end
  end

  def edit
  end

  def update
  end
end

private

def article_params
  params.require(:article).permit(:title, :text, :image, :category_id)
end
