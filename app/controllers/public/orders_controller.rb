class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = current_customer
  end

  def confirm
    @order = Order.new(order_params)
    @payment_method = Order.payment_methods

    if params[:order][:address_option] == "0"

      @order.delivery_post_code = current_customer.post_code
      @order.delivery_address = current_customer.address
      @order.delivery_name = current_customer.last_name + current_customer.first_name

    elsif params[:order][:address_option] == "1"
      @address = Address.find(params[:order][:select_option])
      @order.delivery_post_code = @address.post_code
      @order.delivery_address = @address.address
      @order.delivery_name = @address.name

    else params[:order][:address_option] == "2"
      @order.delivery_post_code = Order.find(params[:order][:new_post_code])
      @order.delivery_address = Order.find(params[:order][:new_address])
      @order.delivery_name = Order.find(params[:order][:new_name])

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
    params.require(:order).permit(:payment_method, :post_code, :address, :name)
  end
end
