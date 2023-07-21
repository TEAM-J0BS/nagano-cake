class Admin::ItemsController < ApplicationController

  def index
    @items = Item.page(params[:page]).per(5)
  end

  def new
    @item = Item.new
    @genres = Genre.pluck(:name, :id)
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_item_path(@item)
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.pluck(:name, :id)
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to admin_item_path(item.id)
  end

  private

  def item_params
    params.require(:item).permit(:name,:introduction,:price,:genre_id,:is_available,:image)
  end
end
