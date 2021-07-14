class CategoriesController < ApplicationController
  before_action :logged_in_user

  def show
    @category = Category.find(params[:id])
    @cat_arts = @category.articles
  end
end
