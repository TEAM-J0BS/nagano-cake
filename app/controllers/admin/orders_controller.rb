class Admin::OrdersController < ApplicationController
  def index
  end
  
  def show
    @order = Order.find(params[:id])
    @total = @order.order_details.inject(0) { |sum, order_detail| sum + order_detail.total_amount }
  end

  def update
  end
end
