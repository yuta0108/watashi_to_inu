class CartItem < ApplicationRecord

  with_options presence: true do
      validates :item_id, uniqueness: { scope: :customer_id }
      validates :amount
      validates :receipt_date
      validates :receipt_date_time
  end

  belongs_to :item
  belongs_to :customer

  has_one_attached :image

  # 小計を求めるメソッド
  def subtotal
    item.with_tax_price * amount
  end
end
