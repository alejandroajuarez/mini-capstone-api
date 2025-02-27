class ProductsController < ApplicationController
  def index
    pp current_user
    puts "===================="
    # @products = Product.all
    @products = Product.where("name LIKE ?", "%#{params[:search]}%")
    render :index
  end

  def show
    id_find = params[:id]
    @product = Product.find_by(id: id_find)
    render :show
  end

  def create
    @product = Product.new(
    name: params[:name],
    price: params[:price],
    quantity: params[:quantity],
    image_url: params[:image_url],
    description: params[:description],
    supplier_id: params[:supplier_id]
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
    @product.quantity = params[:quantity]       || @product.quantity
    @product.image_url = params[:image_url]     || @product.image_url
    @product.description = params[:description] || @product.description
    @product.supplier_id = params[:supplier_id] || @product.supplier_id
    
    if @product.save!
      render :show
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
    render json: { message: "Entry has been deleted" }
  end
end
