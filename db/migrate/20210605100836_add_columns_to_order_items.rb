class AddColumnsToOrderItems < ActiveRecord::Migration[5.2]
  def change
    add_column :order_items, :item_id, :integer
    add_column :order_items, :customer_id, :integer
  end
end
