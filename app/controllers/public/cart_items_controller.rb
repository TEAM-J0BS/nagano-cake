class Public::CartItemsController < ApplicationController
  def index
    @cart_items = cart_item_params[:item_id]
  end

  def update
    @cart_item.update(count: params[:count].to_i)
    reirect_to cart_items_path
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
    if current_customer.cart_items.find_by(item_id: @cartitem.item_id).present?
      @cart_item.count += params[:count].to_i
      @cart_item.save
    else
      @cart_item.save
    end
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :count)
  end
end
