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
    p "*" * 50
    p current_user
    @product = Product.find_by(id: params[:product_id])
    @order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity]
      )
    @order.save
    render 'show.json.jb'
  end
  def show
    @order = Order.find_by(id:params[:id])
    render 'show.json.jb'
  end
end
