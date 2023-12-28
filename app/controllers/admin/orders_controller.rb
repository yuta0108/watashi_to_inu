class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
    @customer = @order.customer
    @order_details = @order.order_details
  end

  def index
    @orders = Order.all
    @orders = @orders.page(params[:page]).per(10)
  end
  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @order.update(order_params)

    params[:order][:cart_item] do |item_param|
      cart_item = CartItem.find_by!(customer_id: current_customer, item_id: item.id)
      cart_item.update!(amount: item.amount)
    end

    if @order.is_receipt == "not_received"
      @order_details.update_all(production_status: "waiting")
    end

    redirect_to admin_order_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:is_receipt)

  end

end

