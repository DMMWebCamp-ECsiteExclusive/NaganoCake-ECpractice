class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!, except: [:index, :show]

  def index
    @genres = Genre.all

    if params[:seach].present?
      @items = Item.where('name LIKE ?', "%#{params[:seach]}%")
    
    elsif params[:name].present?
      @genre = Genre.find(params[:name])

    else
      @items = Item.page(params[:page])
    end

  end

  def show
    @cart_item = CartItem.new
    @customer = current_customer
    @item = Item.find(params[:id])
    @genres = Genre.all
  end


end
