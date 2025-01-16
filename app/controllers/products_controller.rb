class ProductsController < ApplicationController
  def product_view
    @products = Product.all
    render json: @products
  end
end
