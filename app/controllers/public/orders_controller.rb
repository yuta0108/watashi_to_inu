class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def confirm
    @order = Order.new(confirm_params)
    # @item_ids = @order[:item_ids]
    @items = []
    @total_amount = 0
    # `params[:order][:cart_item]` の各要素に対して処理を行い、`Item` モデルのインスタンスを取得している
    params[:order][:cart_item].each do |item_param|
      item = Item.find(item_param[0])
      # カートアイテムを特定して変数にいれる
      cart_item = CartItem.find_by!(customer_id: current_customer, item_id: item.id)
      # `item_param[0]` の値（商品ID）に該当するレコードを検索
      item.amount = item_param[1][:amount].to_i
      # カートの画面から渡ってきた個数にアイテムの個数を更新
      cart_item.update!(amount: item.amount)
      # `item_param[1][:amount]` の値（商品の数量）を整数値に変換して代入
      @total_amount += item.amount
      @items << item
      # `item` オブジェクトを `@items` 配列に追加
    end
    @cart_items = current_customer.cart_items.all
  end

  def create
    @order = Order.new(order_params)
    @items = Item.all
    @cart_items = current_customer.cart_items.all
    if @order.save

      @cart_items.each do |cart_item|
        @order_detail = OrderDetail.new
        @order_detail.item_id = cart_item.item.id
        @order_detail.order_id = @order.id
        @order_detail.amount = cart_item.amount
        @order_detail.tax_included_price = cart_item.item.tax_included_price
        @order_detail.production_status = 0
        @order_detail.save
      end
      current_customer.cart_items.destroy_all
      redirect_to public_orders_thanks_path
    else
      render 'confirm'
    end

  end

  def thanks
  end

  def index
    @orders = Order.where(customer_id: current_customer.id).order(created_at: :desc)
    @order_detail = OrderDetail.where(@order)
  end

  def show
    @order = Order.find(params[:id])
    if @order.customer_id == current_customer.id
      @order_details = OrderDetail.where(order_id: @order.id)
    else
      redirect_to public_orders_path
    end
  end

  private

  def confirm_params
    params.require(:order).permit(:customer_id, :receipt_date, :receipt_time, cart_item: [])
  end


  def order_params
    params.require(:order).permit(:customer_id, :receipt_date, :receipt_time, :charge, :payment_method, :is_receipt, cart_item: {})
  end
end
