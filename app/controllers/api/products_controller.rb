class Api::ProductsController < ApplicationController
  def index
    if params[:discount]
      @products = Product.where("price < ?")
    else
      @products = Product.all
    end

    if params[:search]
      @products = Product.where("name LIKE ?", "%%#{params[:search]}")
    end

    if params[:sort] && params[:sort_order] == "asc"
      @products = @products.order(:price => :asc)
    elsif params[:sort_order] == "desc"
      @products = @products.order(:price => :desc)
    else
      @products = @products.order(:id => :asc)
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
