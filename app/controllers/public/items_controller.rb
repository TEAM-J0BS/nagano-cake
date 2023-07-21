class Public::ItemsController < ApplicationController
 before_action :authenticate_customer!,only:[:show]
  

  def index
    @items = Item.page(params[:page]).per(5)
    @genres = Genre.all
    @q = Item.ransack(params[:q]) # @q 変数を追加
    @search_items = @q.result(distinct: true).page(params[:page]) # 検索結果を @search_items に代入
  end

  def show
    user = User.find(params[:id])
  unless user.id == current_user.id
    redirect_to new_customer_session_path
  end
    @item = Item.find(params[:id])
    @genres = Genre.all
    @cart_item = CartItem.new
  end

  def search
  #  @genres = Genre.all
   # @q = Item.ransack(params[:q])
   #@items = @q.result(distinct: true).page(params[:page])
  end
end

