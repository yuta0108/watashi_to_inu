class Order < ApplicationRecord

  enum payment_method: { credit_card: 0, pay_store: 1 }
end
