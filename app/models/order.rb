class Order < ApplicationRecord
  
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  has_many :items, through: :order_details
  
  enum payment_method: { credit_card: 0, transfer: 1 }
  
  enum status: { waiting_payment: 0, deposited: 1, production: 2, preparing: 3, shipped: 4 }
  
end
