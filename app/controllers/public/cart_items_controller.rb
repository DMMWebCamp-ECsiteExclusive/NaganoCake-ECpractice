class Public::CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.all
    @item = CartItem.find(cart_item_params[:item_id])
    @cart_item = CartItem
  end
  
  def with_tax_price
    (price*1.1).ceil
  end
  
  def subtotal
    item.with_tax_price * amount
  end
    

  def create
    cart_item = CartItem.new(cart_item_params)

    if customer_signed_in?
      cart_item.save
      redirect_to cart_items_path
    else
      redirect_to items_path
    end
  end

  def update
    cart_item = CartItem.find(cart_item_params[:item_id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(cart_item_params[:item_id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    cart_items = CartItem.item.all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end


  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end