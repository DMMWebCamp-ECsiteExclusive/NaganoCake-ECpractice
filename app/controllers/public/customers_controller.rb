class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to customers_mypage_path
  end

  def confirm
    @customer = current_customer
  end

  def resign
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end


private

def customer_params
  params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana,
                                   :post_code, :address, :telephone_number, :email, :is_deleted)
end

end
