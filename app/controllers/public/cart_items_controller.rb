class Public::CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.all
    @item = Item.find(params[:id])
    @price = @item.price*1.1
    @customer = current_customer
  end

  def create
    cart_item = CartItem.new(cart_item_params)
    @customer.id = current_customer.id
    cart_item.save
    redirect_to cart_items_path
  end

  def update
    cart_item = CartItem.find(parmas[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
  end

  def destroy_all
  end


  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end
end