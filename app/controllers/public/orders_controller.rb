class Public::OrdersController < ApplicationController
  def confirm
    @order = params[:order]
    @item_id = @order[:item_id]
    @item = Item.find(@item_id)
    @cart_items = current_customer.cart_items.all
  end

  def thanks
  end

  def index
  end

  def show

  end

  private

  def order_params
      params.require(:order).permit(:customer_id, :receipt_date, :receipt_time, :total_product_quantity, :charge, :total_product_amount, :payment_method, :is_receipt)
  end
end
