class OrdersController < ApplicationController

  def index
    @orders = Order.all
    render :index
  end

  def show
    id_find = params[:id]
    @order = Order.find_by(id: id_find)
    render :show
  end

  def create
    @order = Order.new(
      user_id: params[:user_id],
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: params[:subtotal],
      tax: params[:tax],
      total: params[:total]
    )
    @order.save
    render :show
  end
end