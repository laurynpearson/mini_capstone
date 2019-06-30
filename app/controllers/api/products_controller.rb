class Api::ProductsController < ApplicationController
  # def all_available_products
  #   @product = Product.first
  #   render 'available_products.json.jb'
  # end

  # def find_by
  #   product_name = params["name"]
  #   @product = Product.find_by(name: product_name)
  #   p @product
  #   render 'available_products.json.jb'
  # end

  # def all_products
  #   @products = Product.all
  #   render 'all.json.jb'
  # end

  def index
    @products = Product.all
    render 'index.json.jb'
  end
  def show
    product_id = params[:id]
    @products = Product.find_by(id: product_id)
    render 'show.json.jb'
  end

  def create
    @product = Product.new(
      {
        name: params[:input_name],
        image_url: params[:input_image_url],
        description: params[:input_description],
        price: params[:input_price]
      }
      )
    @product.save
    render 'create.json.jb'
  end

end
