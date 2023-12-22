class Item < ApplicationRecord

# 同じバリデーション条件を持つ属性をまとめる
  with_options presence: true do
      validates :name
      validates :product_description
      validates :tax_included_price
      validates :image
      validates :genre
  end

  belongs_to :genre


  has_many :order_details
  has_many :orders, through: :order_details
  has_many :cart_items

  attr_accessor :amount

  has_one_attached :image

  scope :latest, -> {order(created_at: :desc)} #新しい順
  scope :old, -> {order(created_at: :asc)} #古い順

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "genre_id", "id", "is_sales", "name", "product_description", "tax_included_price", "updated_at"]
  end

  # 消費税を求めるメソッド
  def with_tax_price
    (tax_included_price * 1.1).floor
  end
end