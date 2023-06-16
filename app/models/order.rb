class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details, dependent: :destroy
  has_many :items, through: :order_details

  validates :delivery_post_code, numericality: true, presence: true
  validates :delivery_address, presence: true
  validates :delivery_name, presence: true
  validates :postage, presence: true
  validates :total_payment, presence: true
  validates :payment_method, presence: true


  enum payment_method: { credit_card: 0, transfer: 1 }

  enum status: { waiting_payment: 0, deposited: 1, production: 2, preparing: 3, shipped: 4 }


end
