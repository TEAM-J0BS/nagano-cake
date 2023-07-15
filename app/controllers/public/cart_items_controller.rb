class Public::CartItemsController < ApplicationController
  def index
  end

  def update
  end

  def destroy
  end

  def destroy_all
    current_customer.cart_items.destroy_all
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    if @cart_item.find_by
    end
    @cart_item.save
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :count)
  end
end
