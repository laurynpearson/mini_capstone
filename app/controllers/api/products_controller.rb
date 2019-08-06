class Api::ProductsController < ApplicationController
  def index
    p current_user
    if current_user
      @products = Product.all
    else
      @products = []
    end
    # if params[:category]
    #   category = Category.find_by(name: params[:category])
    #   @products = category.products
    # end
    render 'index.json.jb'

  end
  def show
    @product = Product.find_by(id: params[:id])
    render 'show.json.jb'
  end

  def create
    @product = Product.new(
      {
        name: params[:name],
        # images_url: params[:images_url],
        description: params[:description],
        price: params[:price],
        # in_stock: params[:in_stock]
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
    # @product.images = params[:images]
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
