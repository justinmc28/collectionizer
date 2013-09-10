class AddCentsColumnToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :amount_in_cents, :integer
  end
end
