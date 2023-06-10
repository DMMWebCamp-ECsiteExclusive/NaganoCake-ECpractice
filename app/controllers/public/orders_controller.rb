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
      address = Address.new(address_params[:address])
      address.post_code = @order.delivery_post_code
      address.address = @order.delivery_address
      address.name = @order.delivery_name
      @order_id = current_customer.id
      address.save
    else
      redirect_to cart_items_path

    end
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    cart_items = current_customer.cart_items.all

    if @order.save
      cart_items.each do |cart_item|
        order_detail = OrderDetail.new
        order_detail.item_id = cart_item.item_id
        order_detail.order_id = @order.id
        order_detail.amount = cart_item.amount
        order_detail.order_price = cart_item.item.price * 1.1
        order_detail.save
      end

      # if params[:order][:address_option] == "2"
      #   address = Address.new(address_params[:address])
      #   address.post_code = delivery_post_code
      #   address.address = delivery_address
      #   address.name = delivery_name
      #   address.save
      # end
      redirect_to orders_thanks_path
      cart_items.destroy_all
    else
      @order = Order.new(order_params)
      render :new
    end
  end

  def thanks
  end

  def index
    @orders = Order.all
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

  def address_params
    params.require(:order).permit(address:[:post_code, :address, :name])
  end

end
