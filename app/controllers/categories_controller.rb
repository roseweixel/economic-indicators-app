class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def chart
    @category = Category.find(params[:id])
    render json: @category.line_items.group(:year).sum(:total)
  end
end
