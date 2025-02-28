class CategoriesController < ApplicationController

  def index
    @categories = Category.all
    render :index
  end
  
  def show
    @categories = Category.find_by(product_id: params[:id])
    render :show
   end
end
