class ProductsController < ApplicationController
  def index
    @products = Product.all
    render :index
  end

  def show
    id_find = params[:id]
    @product = Product.find_by(id: id_find)
    render :show
  end

  def create
    @product = Product.new(
    name: params[:input_name],
    price: params[:input_price],
    image_url: params[:input_image_url],
    description: params[:input_description]
    )
    @product.save
    render :show
  end
end
