class Api::ProductsController < ApplicationController
  def all_available_products
    @product = Product.first
    render 'available_products.json.jb'
  end

  def all_products
    @products = Product.all
    render 'all.json.jb'
  end

end
