class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.page(params[:page]).per(10).order("created_at desc")
  end

  def show
    @order = Order.find(params[:id])
    @total = @order.order_details.inject(0) { |sum, order_detail| sum + order_detail.total_price }
  end

  def update
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])

    if @order.update(order_params)
      @order_details.update_all(status: "wait") if @order.status == "check"
    end

    flash[:notice] = "注文ステータスを更新しました。"
    redirect_to admin_order_path(@order)
  rescue => e
    flash[:alert] = "注文ステータスが更新"
    redirect_to admin_order_path(@order)
  end


  private

  def order_params
    params.require(:order).permit(:status)
  end
end
