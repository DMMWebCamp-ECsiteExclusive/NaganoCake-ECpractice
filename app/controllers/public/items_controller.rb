class Public::ItemsController < ApplicationController

  def index

    if params[:item_name].present?
      @item = Item.find(params[:item_name])
      @items = Item.find(params[:item_name][:page])

    elsif params[:genre_name].present?
      @genres = params[:genre_name]

    else
      @items = Item.page(params[:page])
    end

  end

  def show
    @customer = current_customer
    @item = Item.find(params[:id])
  end
end
