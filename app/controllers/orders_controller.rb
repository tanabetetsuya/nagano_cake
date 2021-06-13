class OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @customer = current_customer
  end

  def create
    order = Order.new(order_params)
    order.save
    redirect_to comfirm_order_path
  end

  def comfirm
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    @order.payment_method = params[:order][:payment_method]
    if params[:order][:address_option] == '0'
      @order.postal_code = current_customer.postal_code
      @order.order_address = current_customer.address
    elsif params[:order][:address_option] == '1'
        @sta = params[:order][:address].to_i
        @order_address = Address.find(@sta)
        @order.postal_code = @order_address.postal_code
        @order.order_address = @order_address.shipping_address
    elsif params[:order][:address_option] == '2'
          @order.postal_code = params[:order][:postal_code]
          @order.order_address = params[:order][:order_address]
    end

  end

  def create
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    @cart_items = current_customer.cart_items.all
    @cart_items.each do |cart_item|
        @order_items = @order.order_items.new
        @order_items.item_id = cart_item.item.id
        @order_items.amount = cart_item.amount
        @order_items.order_item_price = cart_item.item.price*1.1
        @order_items.save
       end
       current_customer.cart_items.destroy_all
     redirect_to orders_complete_path
  end

  def complete
  end

  def show
    @order = Order.find(params[:id])

  end

  def index
    @customer = current_customer
    @orders = @customer.orders
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :order_address, :name, :purchase_price, :shipping, :order_status, :payment_method)
  end
end
