class NowCategoriesController < ApplicationController

  def show
    @year = params[:year]
    @categories = Category.all
    @category = Category.find(params[:id])
    @line_item = LineItem.where(year: @year, category_id: @category.id).first
    @articles = @category.now_articles_hash.uniq {|a| a["headline"]["main"].downcase}
    respond_to do |format|
      format.js { }
    end
  end

end
