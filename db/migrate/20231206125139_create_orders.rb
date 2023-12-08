class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false
      t.integer :order_time, null: false
      t.integer :total_product_quantity, null: false
      t.integer :charge, null: false
      t.integer :total_product_amount, null: false
      t.integer :payment_method, null: false
      t.boolean :is_receipt, null: false, default: true

      t.timestamps
    end
  end
end
