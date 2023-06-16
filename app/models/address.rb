class Address < ApplicationRecord
  
  # アソシエーション
  belongs_to :customer
  
  # バリデーション
  validates :post_code, numericality: true, presence: true
  validates :address, presence: true
  validates :name, presence: true
  
  def address_display
    '〒' + post_code + ' ' + address + ' ' + name
  end
  

  
  
end
