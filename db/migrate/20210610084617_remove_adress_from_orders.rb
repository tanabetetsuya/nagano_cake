class RemoveAdressFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :adress, :string
  end
end
