class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end
  
  def update
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])
    
    if @order.update(order_params)
      @order_details.update_all(crafting_status: 1) if @order.status == "deposited"
      redirect_to admin_order_path(@order)
      
    # elsif @order.status != "deposited"
    #   redirect_to admin_order_path(@order)
      
    else
      redirect_to admin_path
    end
    
  end
  
  private
  
  def order_params
    params.require(:order).permit(:status)
  end
  
end
