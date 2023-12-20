class Order < ApplicationRecord
  validates :payment_method, presence: true
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  has_many :items, through: :order_details
  # `Order`モデルが`Item`モデルと多対多の関係


  has_one_attached :image

  enum payment_method: { credit_card: 0, pay_store: 1 }
  enum is_receipt: {not_received: 0, received: 1 }
end
