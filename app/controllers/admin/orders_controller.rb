class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.page(params[:page]).per(10).order("created_at desc")
  end

  def show
    @order = Order.find(params[:id])
    @total = @order.order_details.inject(0) { |sum, order_detail| sum + order_detail.total_price }
  end

  def update
  end
end
