class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_root_path
  end

  private
  def order_params
    params.require(:order).permit(:postal_code, :name, :purchase_price, :shipping, :payment_method, :customer_id, :address, :order_address, :order_status)
  end
end
