class CartedProductsController < ApplicationController
  
  def index
    @carted_products = CartedProduct.all
    render :index
  end

  def show
    id_find = params[:id]
    @carted_product = CartedProduct.find_by(id: id_find)
    render :show
  end
  def create
    @carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      order_id: params[:order_id],
      status: params[:status]
    )
    if @carted_product.save!
      render :show
    else
      render json: { errors: @carted_product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    carted_product = CartedProduct.find_by(id: params[:id])
    carted_product.destroy
    render json: { message: "Cart has been cleared" }
  end
end
