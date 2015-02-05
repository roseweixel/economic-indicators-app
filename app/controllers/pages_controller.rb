class PagesController < ApplicationController
  def about
    @categories = Category.all
    render 'about'
  end
end
