class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  
  def top
    @orders = Order.page(params[:page])
    # @name = customer.last_name + customer.first_name
    # @amounts = OrderDetail.amount
  end
end
