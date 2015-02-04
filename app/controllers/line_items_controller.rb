class LineItemsController < ApplicationController

  def show
    @line_item = LineItem.where(category_id: params[:category_id], year: params[:id]).first
    @articles = @line_item.articles_hash
    # @headlines = @line_item.headlines
    respond_to do |format|
      format.js { }
    end
  end

end
