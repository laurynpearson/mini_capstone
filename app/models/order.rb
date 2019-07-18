class Order < ApplicationRecord
  has_many :carted_products
  belongs_to :user

  def subtotal
    price * quantity
  end

  def tax
    tax_rate = 0.09
    @tax_price = price * tax_rate
    @tax_price
  end

  def total
    price + @tax_price
  end

  # def ordertotal
  #   @carted_products = CartedProduct.where(status: "carted", user_id: current_user)
  #   sum = 0
  #   @carted_products.map do |carted_product|
  #     sum = carted_product.product.total + sum
  #   end
  #   return sum
  # end
  def ordertotal
    @carted_product = CartedProduct.where(status: ‘carted’, user_id: current_user)
    sum = 0
    subtotal = 0
    @carted_product.map do |carted_product|
      subtotal = carted_product.price * carted_product.quantity
      sum = subtotal + sum
    end
    return sum
  end
end
