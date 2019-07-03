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
        name: params[:name],
        image_url: params[:image_url],
        description: params[:description],
        price: params[:price],
        in_stock: params[:in_stock]
      }
      )
    @product.save
    render 'create.json.jb'
  end

  def update
    product_id = params[:id]
    #@product = Product.update() works as well and dont need .save if you use this one
    @product = Product.find_by(id: product_id)
    @product.name = params[:name]
    @product.image_url = params[:image_url]
    @product.description = params[:description]
    @product.price = params[:price]
    @product.in_stock = params[:in_stock]
    @product.save
    render 'update.json.jb'
  end

  def destroy
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    @product.destroy
    render 'destroy.json.jb'
  end
end
