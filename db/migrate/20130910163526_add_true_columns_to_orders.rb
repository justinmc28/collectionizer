class AddTrueColumnsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :anonymous, :boolean
    add_column :orders, :charity, :string
  end
end
