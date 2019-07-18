class Api::OrdersController < ApplicationController
  def index
    @orders = Order.all
    p current_user
    if current_user
      @orders = current_user.orders
      render 'index.json.jb'
    else
      render json: [], status: :unauthorized
    end
    
  end

  def create
    # find all the carted products in the shopping cart for the user who is logged in
    @carted_product = CartedProduct.where(status: "carted", user_id: current_user)
    # figure out how much each one will cost (price * quantity)
    subtotal = 0
    tax = 0
    @carted_products.each do |carted_product|
      subtotal += carted_product.quantity * carted_product.product.price
      tax += carted_product.quantity * carted_product.product.tax
    end
    # add up all the price * quantities for a subtotal
    total = subtotal + tax

    @order = Order.new(
      subtotal: subtotal,
      tax: tax,
      total: total,
      user_id: current_user.id
    )
    @order.save

    @carted_products.update(status: 'purchased', order_id: @order.id)
    render 'show.json.jb'
  end

  def show
    @order = Order.find_by(id:params[:id])
    render 'show.json.jb'
  end
end
