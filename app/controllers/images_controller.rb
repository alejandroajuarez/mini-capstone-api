class ImagesController < ApplicationController
  def index
    @image = Image.all
    render json: @image
  end

  def show
    @image = Image.find(params[:id])
    render json: @image
  end

  def create
    @image = Image.new(
      url: params[:url],
      product_id: params[product_id:]
    )
    if @image.save
      render :show
    else
      render json: { errors: @image.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @image = Image.find_by(id: params[:id])
    @image.url = params[:url]               || @image.url
    @image.product_id = params[:product_id] || @image.product_id

    if @image.save
      render :show
    else
      render json: { errors: @image.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    image = Image.find_by(id: params[:id])
    image.destroy
    render json: { message: "Entry has been deleted" }
  end
end
