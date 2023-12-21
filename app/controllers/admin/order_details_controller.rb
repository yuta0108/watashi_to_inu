class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order

    @order_detail.update(order_detail_params)
    if @order_detail.production_status == "production"
      @order.update(is_receipt: true)
    elsif @order.order_details.count == @order.order_details.where(production_status: "completed").count
      @order.update(is_receipt: false)
    end

    redirect_to admin_order_path(@order_detail.order)
    flash[:notice] = "更新に成功しました！"
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:production_status)
  end

  def is_making_completed(order)
    order.order_details.each do |order_detail|
      if order_detail.production_status != 'completed'
        return false
      end
    end
    return true
  end

end
