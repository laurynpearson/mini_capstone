class Product < ApplicationRecord
  has_many :carted_products
  has_many :product_categories
  has_many :categories, through: :product_categories
  has_many :images
  has_many :orders
  belongs_to :supplier

  def is_discounted?
    if price < 2
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

  def supplier
    Supplier.find_by(id: supplier_id)
  end


  # validates :name, presence: true
  
  # validates :price, presence: true

  # validates :description, presence: true

  # validates :name, uniqueness: true

  # validates :description, length: {in: 10..500}

  # validates :price, numericality: {only_integer: true}

end
