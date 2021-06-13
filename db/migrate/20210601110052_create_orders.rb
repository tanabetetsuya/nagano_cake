class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :postal_code
      t.string :adress
      t.string :name
      t.integer :purchase_price
      t.integer :shipping
      t.integer :payment_method
      t.integer :order_status

      t.timestamps
    end
  end
end
