class Public::ItemsController < ApplicationController
  
  def index
    
    if params[:item_name].exists?
      @items = Item.page(params[:item_name, :page])
    else
      @items = Item.page(params[:page])
    end
    
  end

  def show
    @customer = current_customer
    @item = Item.find(params[:id])
  end
end
