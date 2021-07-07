class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @cat_arts = @category.articles
  end
end
