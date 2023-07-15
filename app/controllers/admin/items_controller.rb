class Admin::ItemsController < ApplicationController

  def index
    @items = Itempage.(params[:page])
  end

  def new
    @item = Item.new
  end
  
  def show
    @item = Item.find(params[:id])
  end

  def create
    @Item = Item.new(item_params)
    @item.save
    redirect_to admin_item_path(item)
  end
  
  def edit
    @item = Item.find(params[:id])
  end
  
  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to item_path(item.id)
  end

  def item_params
    params.require(:item).permit(:name,:introduction,:price,:ganre_id,:is_available)
  end
end
