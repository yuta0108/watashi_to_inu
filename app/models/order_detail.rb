class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :item

  enum production_status: { waiting: 0, production: 1, completed: 2 }
end
