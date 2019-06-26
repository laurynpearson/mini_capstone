class Api::ProductsController < ApplicationController
  def all_available_products
    render 'available_products.json.jb'
  end
end
