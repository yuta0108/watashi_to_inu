class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order

    previous_production_status = @order_detail.production_status_before_last_save
    # 最後の保存前の`@order_detail`の`production_status`を`previous_production_status`に代入
    @order_detail.update(order_detail_params)
    if @order_detail.production_status_changed?
        # `production_status`が変更されたかどうかを確認
      if @order_detail.production_status == "completed"
        @order.update(is_receipt: true)
      else
        @order.update(is_receipt: false)
      end
    elsif previous_production_status == "completed" && @order.order_details.where(production_status: "completed").count == 0
      # previous_production_status`が"completed"であり、かつ`@order`に紐づく`@order_detail`のうち、"completed"のステータスを持つ`@order_detail`が0件である場合
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
