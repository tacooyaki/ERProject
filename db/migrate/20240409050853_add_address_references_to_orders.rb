class AddAddressReferencesToOrders < ActiveRecord::Migration[7.1]
  def change
    add_reference :orders, :shipping_address, null: true, foreign_key: { to_table: :addresses }
    add_reference :orders, :billing_address, null: true, foreign_key: { to_table: :addresses }
  end
end
