class Public::CustomersController < ApplicationController
  
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
  end

  def confirm
  end
  
  def resign
    @customer = current_customer
    @customer.patch
    redirect_to root_path
  end
  
end
