class Order < ApplicationRecord
  has_one_attached :image  

  enum payment_method: { credit_card: 0, pay_store: 1 }
end
