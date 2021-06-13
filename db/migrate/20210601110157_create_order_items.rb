class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :order_item_price
      t.integer :amount
      t.integer :production_status
      t.timestamps
    end
  end
end
