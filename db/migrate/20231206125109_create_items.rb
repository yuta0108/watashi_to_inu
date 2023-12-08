class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :genre_id, null: false
      t.string :name, null: false
      t.text :product_description, null: false
      t.integer :tax_included_price, null: false
      t.boolean :is_sales, null: false, default: true

      t.timestamps
    end
  end
end
