class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = Order.find(params[:order_detail][:order_id])
    @order_details = @order.order_details.all

    is_updated = true

    if @order_detail.update(order_detail_params)
      @order.update(status: 2) if @order_detail.crafting_status == "running"

      @order_details.each do |order_detail|
        if order_detail.crafting_status != "finish"
          is_updated = false
        end
      end

      @order.update(status: 3) if is_updated
      redirect_to admin_order_path(@order_detail)

    elsif @order_detail.crafting_status != "running"
      redirect_to admin_order_path(@order_detail)

    else
      redirect_to admin_path

    end

    # order_detail = OrderDetail.find(params[:id])
    # @order = Order.status
    # order_detail.update(order_detail_params)

    # if @order.order_detail.crafting_status ==
    #   redirect_to admin_order_path(order_detail)
    # else
    #   render admin_path
    # end

  end


  private

  def order_detail_params
    params.require(:order_detail).permit(:crafting_status, :order_id)
  end

end
