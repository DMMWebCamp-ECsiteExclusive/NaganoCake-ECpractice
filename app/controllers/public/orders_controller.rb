class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = current_customer
  end

  def confirm
    @order = Order.new(order_params)
    @payment_method = Order.payment_methods
    @cart_items = current_customer.cart_items.all
    @total_price = @cart_items.inject(0) { |sum, cart_item| sum + cart_item.subtotal }
    @postage = 800
    @total_payment = @total_price + @postage

    if params[:order][:address_option] == "0"

      @order.delivery_post_code = current_customer.post_code
      @order.delivery_address = current_customer.address
      @order.delivery_name = current_customer.last_name + current_customer.first_name

    elsif params[:order][:address_option] == "1"
      @address = Address.find(params[:order][:select_option])
      @order.delivery_post_code = @address.post_code
      @order.delivery_address = @address.address
      @order.delivery_name = @address.name

    elsif params[:order][:address_option] == "2"
      @order.delivery_post_code = @order.delivery_post_code
      @order.delivery_address = @order.delivery_address
      @order.delivery_name = @order.delivery_name
    else
      redirect_to cart_items_path

    end
  end

  def create
    @order = Order.new(order_params)
    @order_detail = OrderDetail.new(order_detail_params)
    @cart_items = current_customer.cart_items.all

    if @order.customer_id = current_customer.id
      @order.save
      @cart_items.save
      @cart_items.destroy_all
      redirect_to orders_thanks_path
    else
      redirect_to root_path
    end
  end

  def thanks
  end

  def index
  end

  def show
    if params[:id] == "confirm"
      redirect_to new_order_path
    end

  end


  private

  def order_params
    params.require(:order).permit(:payment_method, :delivery_post_code, :delivery_address, :delivery_name, :total_payment, :postage)
  end

  def order_detail_params
    params.require(:order_detail).permit(:order_id, :item_id, :amount, :order_price)
  end
end
