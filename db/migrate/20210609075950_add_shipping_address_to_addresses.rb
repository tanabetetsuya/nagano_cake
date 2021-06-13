class AddShippingAddressToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :shipping_address, :string
  end
end
