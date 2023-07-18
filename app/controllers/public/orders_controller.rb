class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
  end

  def check
    @customer = current_customer
    @cart_items = @customer.cart_items
    @order = Order.new(order_params)
    @order.payment_method = @customer.payment_method
    @order.postcode = @customer.postcode
    @order.address = @customer.address
    @order.name = @customer.first_name + current_customer.last_name
  end

  def complete
  end

  def create
  end

  def index
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :postcode, :address, :name)
  end
end
