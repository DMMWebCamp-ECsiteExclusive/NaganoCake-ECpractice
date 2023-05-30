class Public::AddressesController < ApplicationController

  def index
    @address = Address.new
    @customer = current_customer
    @addresses = Address.all
  end

  def create
    address = Address.new(address_params)
    address.save
    redirect_to addresses_path(current_customer)
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    address = Address.find(params[:id])
    address.update(address_params)
    redirect_to addresses_path(current_cutomer)
  end


  private

  def address_params
    params.require(:address).permit(:name, :post_code, :address, :customer_id)
  end

end
