class Order < ApplicationRecord

  with_options presence: true do
    validates :payment_method
    validates :receipt_date
    validates :receipt_time
  end

  belongs_to :customer
  has_many :order_details, dependent: :destroy
  has_many :items, through: :order_details
  # `Order`モデルが`Item`モデルと多対多の関係


  has_one_attached :image

  enum payment_method: { credit_card: 0, pay_store: 1 }
  enum is_receipt: {not_received: true, received: false }
end
