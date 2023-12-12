class CartItem < ApplicationRecord

  with_options presence: true do
      validates :item_id, uniqueness: { scope: :customer_id }
      validates :amount
  end

  belongs_to :item
  belongs_to :customer

  has_one_attached :image

  # 小計を求めるメソッド
  # 税込価格と数量をかけて算出
  def subtotal
    item.with_tax_price * amount
  end
end
