class Item < ApplicationRecord

# 同じバリデーション条件を持つ属性をまとめる
  with_options presence: true do
      validates :name
      validates :product_description
      validates :tax_included_price
      validates :image
  end

  belongs_to :genre

  has_many :order_details
  has_many :orders, through: :order_details
  has_many :cart_items

  has_one_attached :image

  # 消費税を求めるメソッド
  def with_tax_price
    (tax_included_price * 1.1).floor
  end
end