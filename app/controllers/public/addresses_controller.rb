class Public::AddressesController < ApplicationController
  
  def index
    @address = Address.new
    @customer = current_customer
    @addresses = Address.all
  end
  
  def create
    address = Address.new(params_address)
    address.save
    redirect_to addresses_path(current_customer)
  end

  def edit
    @address = Address.find(params[:id])
  end
  
  
  private
  
  def params_address
    params.require(:address).permit(:name, :post_code, :address)
  end
  
end
