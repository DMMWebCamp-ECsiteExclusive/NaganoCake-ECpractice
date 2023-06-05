class Admin::OrdersController < ApplicationController
  
  def show
    @orders = Order.page(params[:page])
    @name = (last_name + first_name)
    @amounts = order_detail.amount.all
  end
  
end
