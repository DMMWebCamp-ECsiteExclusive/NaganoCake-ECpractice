class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customers = Customer.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
    @customer_name = @customer.last_name + @customer.first_name
  end

  def edit
    @customer = Customer.find(params[:id])
    @customer_name = @customer.last_name + @customer.first_name
  end

  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
    redirect_to admin_customer_path(customer)
  end


  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana,
                                   :post_code, :address, :telephone_number, :email, :is_deleted)
  end

end
