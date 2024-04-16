class AddFinancialsToOrders < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :subtotal, :decimal
    add_column :orders, :tax, :decimal
    add_column :orders, :total, :decimal
  end
end
