class Api::ProductsController < ApplicationController
  def index
    if params[:sort]
      @products = Product.all.order(price: :asc)
    else
      @products = Product.all
    end
    render 'index.json.jb'
  end

  def show
    product_search = params[:id]
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
    if @product.save
      render 'create.json.jb'
    else
      render 'errors.json.jb'
    end
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

    if @product.save
      render 'show.json.jb'
    else
      render 'errors.json.jb'
    end
  end

  def destroy
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    @product.destroy
    render 'destroy.json.jb'
  end
end
