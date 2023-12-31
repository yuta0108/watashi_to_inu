class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false
      t.integer :charge, null: false
      t.integer :payment_method, null: false
      t.string :receipt_date, null: false
      t.string :receipt_time, null: false

      t.boolean :is_receipt, null: false, default: true

      t.timestamps
    end
  end
end
