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
    name: "Audio-Technica M50x Headphones",
    price: 149,
    image_url: "https://media.sweetwater.com/m/giveaway/2025/01/popup/0101-January-Giveaway-SitePopUp-1140-740.png?optimize=medium&quality=75&ha=155b5b6073b2f792",
    description: "Closed back studio monitoring headphones."
    )
    @product.save
    render :show
  end
end
