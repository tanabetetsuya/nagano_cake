class RemoveCustomerIdFromOrderItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :order_items, :customer_id, :integer
  end
end
