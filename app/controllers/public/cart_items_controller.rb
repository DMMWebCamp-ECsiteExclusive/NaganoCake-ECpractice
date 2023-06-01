class Public::CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.all(cart_item_params[:item_id])
    @item = CartItem.find(cart_item_params[:item_id])
    @cart_item = CartItem
    @price = @item.price*1.1
  end

  def create
    cart_item = CartItem.new(cart_item_params)
    cart_item.customer_id = current_customer.id
    cart_item.save
    redirect_to cart_items_path
  end

  def update
    cart_item = CartItem.find(cart_item_parmas[:item_id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
  end

  def destroy_all
  end


  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end