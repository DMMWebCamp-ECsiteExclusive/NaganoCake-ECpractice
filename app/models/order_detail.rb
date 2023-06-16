class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :item

  enum crafting_status: { cannot_start: 0, waiting_craft: 1, running: 2, finish: 3 }



def subtotal
  order_price * amount
end

end
