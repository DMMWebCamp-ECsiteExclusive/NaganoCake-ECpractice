class Address < ApplicationRecord
  
  belongs_to :customer
  
  def address_display
    '〒' + post_code + ' ' + address + ' ' + name
  end
  
  def new_post_code
    post_code = new_post_code
  end
  
  
  
end
