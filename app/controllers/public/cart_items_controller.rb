class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
  end


  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(count: params[:count].to_i)
    redirect_to cart_items_path
  end


  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end


  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end


  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if current_customer.cart_items.find_by(item_id: @cart_item.item_id).present?
      @cart_item.count += params[:cart_item][:count].to_i
    end


    if @cart_item.save
      redirect_to cart_items_path, notice: "商品を追加しました。"
    else
      redirect_to item_path(@cart_item.item), notice: "追加に失敗しました。"
    end
  end


  private
  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :count)
  end
end
