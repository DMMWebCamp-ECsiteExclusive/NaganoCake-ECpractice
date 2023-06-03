class Public::CartItemsController < ApplicationController

  def index
    # @cart_items = CartItem.all
    # @cart_item = CartItem.find(cart_item_params[:item_id])
    @cart_items = current_customer.cart_items.all
    @total_price = @cart_items.inject(0) { |sum, cart_item| sum + cart_item.subtotal }
  end


  def create
    cart_item = CartItem.new(cart_item_params)

    if customer_signed_in?
      cart_item.customer_id = current_customer.id
      cart_item.save
      redirect_to cart_items_path
    else
      redirect_to items_path
    end
  end

  def update
    cart_item = CartItem.find(cart_item_params[:amount])
    # cart_item.customer_id = current_customer.id
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(cart_item_params[:item_id])
    cart_item.customer_id = current_customer.id
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    cart_item.customer_id = current_customer.id
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end


  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end