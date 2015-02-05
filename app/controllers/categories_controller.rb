class CategoriesController < ApplicationController
  def index
    id = (Category.pluck(:id)).sample
    redirect_to category_path(id)
  end

  def show
    @categories = Category.all
    @category = Category.find(params[:id])
  end

  def chart
    @category = Category.find(params[:id])
    render json: @category.line_items.group(:year).sum(:total)
  end
end
