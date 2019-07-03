class Product < ApplicationRecord
  def is_discounted?
    if price.to_i == 10
      "True"
    else
      "False"
    end
  end

  def tax
    @tax_price = (price.to_i * 0.09)
    @tax_price
  end

  def total
    total_price = (price.to_i + @tax_price)
    total_price
  end
end
