class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @address = Address.new
    @customer = current_customer
    # @order.save
    # @address.save
    # redirect_to orders_confirm_path 
  end
  
  def confirm
    byebug
    # @order = Order.new(order_params)
    # if params[:order][:address_id] == "0"
    #   @order = current_customer
    #   @order_name = current_customer.last_name + current_customer.first_name
      
    # elsif params[:order][:address_id] == "1"
    #   @order = Address.find(params[:id])
    #   @order_name = @order.name
      
    # else params[:order][:address_id] == "2"
    #   @order = Address.find(params[:id])
    #   @order_name = @order.name
      
    # end
    
    # @order.save
    # redirect_to orders_thanks_path
  end

  def thanks
  end

  def index
  end

  def show
  end
  
  
  private
  
  def order_params
    params.require(:order).permit(:payment_method, :post_code, :address, :name)
  end
end
