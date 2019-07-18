class CartedProduct < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :order, optional: true

  def ordertotal
    @carted_products = CartedProduct.find_by(status: "carted")
    sum = 0
    @carted_products.map do |carted_product|
      sum = carted_product.total + sum
    end
    return sum
  end
end
