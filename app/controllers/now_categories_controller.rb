class NowCategoriesController < ApplicationController

  def show
    @categories = Category.all
    @category = Category.find(params[:id])
    @articles = @category.now_articles_hash.uniq {|a| a["headline"]["main"].downcase}
    respond_to do |format|
      format.html
      format.js { }
    end
  end

end
