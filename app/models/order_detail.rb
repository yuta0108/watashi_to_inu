class OrderDetail < ApplicationRecord

  enum production_status: { waiting: 0, production: 1, completed: 2 }
end
