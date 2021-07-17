class CategoriesController < ApplicationController
  before_action :logged_in_user
  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    if @category.valid?
      redirect_to new_article_path
    else
      render 'new'
    end
  end

  def show
    @category = Category.find(params[:id])
    @cat_arts = @category.articles
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
