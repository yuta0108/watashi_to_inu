class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer :order_id, null: false
      t.integer :item_id, null: false
      t.integer :amount, null: false
      t.integer :tax_included_price, null: false
      t.integer :production_status, null: false

      t.timestamps
    end
  end
end
