class AddNamesColumnToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :f_name, :string
    add_column :orders, :l_name, :string
  end
end
