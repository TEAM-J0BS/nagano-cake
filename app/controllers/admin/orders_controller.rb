class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

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
  @order = Order.find(params[:id])
  @order_details = OrderDetail.where(order_id: params[:id])

  if @order.update(order_params) && @order.status == "check"
    @order_details.each do |order_detail|
      order_detail.update(making_status: "wait")
    end
  end

    flash[:notice] = "注文ステータスを更新しました。"
    redirect_to admin_order_path(@order)
  rescue => e
    flash[:alert] = "注文ステータスの更新に失敗しました。"
    redirect_to admin_order_path(@order)
  end


  private

  def order_params
    params.require(:order).permit(:status)
  end
end
