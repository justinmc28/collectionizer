class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :amount
      t.string :email
      t.string :card

      t.timestamps
    end
  end
end
