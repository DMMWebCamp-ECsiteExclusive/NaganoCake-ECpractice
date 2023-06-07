class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!, except: [:index, :show]

  def index

    # if params[:item_name].present?
    #   @item = Item.find(params[:item_name])
    #   @items = Item.find(params[:item_name][:page])

    # elsif params[:genre_name].present?
    #   @genres = params[:genre_name]

    # else
      @items = Item.page(params[:page])
    # end

  end

  def show
    @cart_item = CartItem.new
    @customer = current_customer
    @item = Item.find(params[:id])
    @price = (@item.price*1.1).ceil
  end


end
