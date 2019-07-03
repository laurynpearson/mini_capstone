class Product < ApplicationRecord
  def is_discounted?
    if price > 10
      return true
    else
      return false
    end
  end

  def tax
    tax_rate = 0.09
    @tax_price = price * tax_rate
    @tax_price
  end

  def total
    price + @tax_price
  end
end
