class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @customer = current_customer
    if current_customer.cart_items.count.zero?
      redirect_to items_path, notice: "カートが空です。商品を追加してください。"
    else
      @oreder = Order.new
    end
  end

  def check
    @customer = current_customer
    @cart_items = @customer.cart_items
    @order = Order.new(order_params)
    @order.postcode = @customer.postcode
    @order.address = @customer.address
    @order.name = @customer.full_name
    @shipping_fee = 800
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
    @total_amount = @shipping_fee + @total

    if params[:order][:select_address] == "0"
      @order.postcode = @customer.postcode
      @order.address = @customer.address
      @order.name = @customer.full_name
    elsif params[:order][:select_address] == "1"
      address = Address.find(params[:order][:address_id])
      @order.postcode = address.postcode
      @order.address = address.address
      @order.name = address.name
    elsif params[:order][:select_address] == "2"
      @order.postcode = params[:order][:postcode]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    end

    if @order.address.blank? || @order.name.blank?
      flash[:notice] = "正しい情報を入力してください"
      redirect_to request.referer
    end
  end

  def complete
    @genres = Genre.all
  end

  def create
    cart_items = current_customer.cart_items
    @order = current_customer.orders.new(order_params)
    if @order.save
      cart_items.each do |cart|
        order_detail = OrderDetail.new
        order_detail.item_id = cart.item_id
        order_detail.order_id = @order.id
        order_detail.count = cart.count
        order_detail.tax_price = cart.item.with_tax_price
        order_detail.save
      end
      redirect_to complete_orders_path
      cart_items.destroy_all
    else
      redirect_to new_order_path, notice: "支払い方法・配送先を選択してください。"
    end
  end

  def index
    @orders = Order.all.order("created_at desc")
    @orders = current_customer.orders.order("created_at desc")
    @genres = Genre.all
  end

  def show
    @order = Order.find(params[:id])
    @cart_items = current_customer.cart_items
    @genres = Genre.all
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :payment_method, :postcode, :address, :name, :total_amount, :shipping_fee)
  end
end
