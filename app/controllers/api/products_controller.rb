class Api::ProductsController < ApplicationController
  def all_available_products
    @product = Product.first
    render 'available_products.json.jb'
  end

  def all_products
    @products = Product.all
    render 'all.json.jb'
  end
  def any_product_method
    render 'any_product.json.jb'
  end
end
