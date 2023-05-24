class Item < ApplicationRecord
  
  belongs_to :genre
  has_many :item_details, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  
end
