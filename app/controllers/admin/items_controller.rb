class Admin::ItemsController < ApplicationController
  
  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
    item.save
    redirect_to admin_item_path
  end

  def index
    @items = Item.page(params[:page])
    @item = Item.find(params[:id])
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end
  
  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to admin_item_path(item)
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :item_image, :genre_id, :is_sale)
  end
  
end
