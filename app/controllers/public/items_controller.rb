class Public::ItemsController < ApplicationController
  
  def index
    @item = Item.page(params[:page])
  end

  def show
    @customer = current_customer
    @item = Item.find(params[:id])
  end
end
