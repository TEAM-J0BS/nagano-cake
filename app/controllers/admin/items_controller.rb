class Admin::ItemsController < ApplicationController

  def index
    @items = Itempage.(params[:page])
  end

  def new
    @item = Item.new
  end

  def create
    @Item = Item.new(item_params)
    item.save
    redirect_to admin_item_path(item)
  end

  def item_params
    params.require(:item).permit(:name,:introduction,:price,:ganre_id,:is_available)
  end
end
