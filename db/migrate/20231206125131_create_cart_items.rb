class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.integer :item_id, null: false
      t.integer :customer_id, null: false
      t.integer :amount, null: false
      t.integer :receipt_date, null: true
      t.integer :receipt_time, null: true


      t.timestamps
    end
  end
end
