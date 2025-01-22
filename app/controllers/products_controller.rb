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
    if @product.save
      render :show
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.name = params[:name]               || @product.name
    @product.price = params[:price]             || @product.price
    @product.image_url = params[:image_url]     || @product.image_url
    @product.description = params[:description] || @product.description
    
    if @product.save
      render :show
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
    render json: {message: "Entry has been deleted" }
  end
end
