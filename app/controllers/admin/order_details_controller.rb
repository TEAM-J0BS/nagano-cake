class Admin::OrderDetailsController < ApplicationController

   def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details
    is_updated = true

    OrderDetail.transaction do
      @order_detail.update(order_detail_params)

      @order_details.each do |order_detail|
        if order_detail.status != "finish"
          is_updated = false
        end
      end

      @order.update(status: 2) if @order_details.any? { |oi| oi.status == "maiking" }
      @order.update(status: 3) if is_updated
    end

    if @order_detail.errors.any?
      flash[:alert] = "Failed to update order item"
    else
      flash[:notice] = "Updated order item successfully"
    end

    redirect_to admin_order_path(@order)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:status)
  end
end