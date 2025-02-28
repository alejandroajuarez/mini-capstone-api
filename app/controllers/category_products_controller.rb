class CategoryProductsController < ApplicationController
  def create
    @category_product = CategoryProduct.new(
      product_id: params[:product_id],
      category_id: params[:category_id],
    )
    @category_product.save!
    render :show
  end
end