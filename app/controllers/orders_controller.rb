class OrdersController < ApplicationController

  def index
    @orders = Order.where(user_id: current_user.id)
    render :index
  end

  def show
    id_find = params[:id]
    @order = Order.find_by(id: id_find)
    render :show
  end

  def create
    @carted_products = CartedProduct.where(status: "carted", user_id: current_user.id)

    sum = 0
    @carted_products.each do |cp|
      item_subtotal = cp.quantity * cp.product.price
      sum += item_subtotal
    end

    calculated_tax = sum * 0.09

    @order = Order.new(
      user_id: current_user.id,
      subtotal: sum,
      tax: calculated_tax,
      total: sum + calculated_tax
    )
    @order.save

    @carted_products.each do |cp|
      cp.order_id = @order.id
      cp.status = "purchased"
      cp.save
    end

    render :show
    
  end
end