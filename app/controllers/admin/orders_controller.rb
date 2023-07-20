class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.page(params[:page]).per(10).order("created_at desc")
  end

  def individual
    @customer = Customer.find(params[:id])
    @orders = @customer.orders.page(params[:page]).per(10).order("created_at desc")
  end

  def show
    @order = Order.find(params[:id])
    @total = @order.order_details.inject(0) { |sum, order_detail| sum + order_detail.total_price }
  end

  def update
    order = Order.find(params[:id])
    order_details = OrderDetail.where(order_id: params[:id])
    Order.transaction do
      order.update(order_params)
      if order.status == "check"
        order_details.update(status: 1)
      end
    end
      flash[:notice] = "updated order status successfully"
      redirect_to admin_order_path(order)
    rescue => e
      flash[:alert] = "failed update"
      redirect_to admin_order_path(order)
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end
end
