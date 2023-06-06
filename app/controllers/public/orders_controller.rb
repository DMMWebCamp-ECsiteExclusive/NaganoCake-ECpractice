class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @address = Address.new
    @customer = current_customer
  end
  
  def confirm
    @order = Order.new(order_params)
    
    if params[:order][:address_id] == "0"
      @order.post_code = current_customer.post_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
      
    elsif params[:order][:address_id] == "1"
      @address = Order.find(params[:order][:address_id])
      @order.post_code = @address.post_code
      @order.address = @address.address
      @order.name = @address.name
      
    else params[:order][:address_id] == "2"
      @order.post_code = Order.find(params[:order][:new_post_code])
      @order.address = Order.find(params[:order][:new_address])
      @order_name = Order.find(params[:order][:new_name])

    end
  end
  
  def create
  end

  def thanks
  end

  def index
  end

  def show
  end
  
  
  private
  
  def order_params
    params.require(:order).permit(:payment_method, :address_id, :post_code, :address, :name, :new_post_code, :new_address, :new_name)
  end
end
