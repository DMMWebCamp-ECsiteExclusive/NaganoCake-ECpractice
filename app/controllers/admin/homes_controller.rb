class Admin::HomesController < ApplicationController
  
  def top
    @orders = Order.page(params[:page])
    # @name = customer.last_name + customer.first_name
    # @amounts = OrderDetail.amount
  end
end
