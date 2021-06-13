class AddOrderAddressToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :order_address, :string
  end
end
