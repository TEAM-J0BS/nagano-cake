class Admin::OrderDetailsController < ApplicationController

   def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details
    @order_detail.update(order_detail_params)
    @making_statuses = @order_details.pluck(:making_status)
    @order.update(status: "making") if @making_statuses.any?{|val| val == "making" }
    @order.update(status: "standby") if @making_statuses.all?{|val| val ==  "finish"}
    redirect_to admin_order_path(@order)

    if @order_detail.errors.any?
      flash[:alert] = "製作ステータスが更新できませんでした。"
    else
      flash[:notice] = "製作ステータスを更新しました。"
    end
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end