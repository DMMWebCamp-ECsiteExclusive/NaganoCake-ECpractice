class Public::ItemsController < ApplicationController
  
  def index
    # @genre = Genre.find(params[:genre_name])
    
    if params[:item_name].exists?
      @items = Item.page(params[:item_name, :page])
    else
      @items = Item.page(params[:page])
    end
    
  end

  def show
    # @genre = Genre.find(params[:genre_name])
    @customer = current_customer
    @item = Item.find(params[:id])
  end
end
