class LineItemsController < ApplicationController

  def show
    @line_item = LineItem.where(category_id: params[:category_id], year: params[:id]).first
  end

end
