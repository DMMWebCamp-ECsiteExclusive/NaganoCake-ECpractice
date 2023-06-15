class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @address = Address.new
    @customer = current_customer
    @addresses = @customer.addresses.all
  end

  def create
    address = Address.new(address_params)
    address.customer_id = current_customer.id

    if address.save
      redirect_to addresses_path(current_customer)
    else
      render :index
    end

  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    address = Address.find(params[:id])
    address.update(address_params)
    redirect_to addresses_path(current_customer)
  end

  def destroy
    address = Address.find(params[:id])
    address.customer_id = current_customer.id
    address.destroy
    redirect_to addresses_path(current_customer)
  end


  private

  def address_params
    params.require(:address).permit(:name, :post_code, :address, :customer_id)
  end

end
