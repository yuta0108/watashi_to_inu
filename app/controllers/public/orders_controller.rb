class Public::OrdersController < ApplicationController
  def confirm
    @order = Order.new(confirm_params)
    # @item_ids = @order[:item_ids]
    @items = []
    @total_amount = 0
    # `params[:order][:cart_item]` の各要素に対して処理を行い、`Item` モデルのインスタンスを取得している
    params[:order][:cart_item].each do |item_param|
      item = Item.find(item_param[0])
      # `item_param[0]` の値（商品ID）に該当するレコードを検索
      item.amount = item_param[1][:amount].to_i
      # `item_param[1][:amount]` の値（商品の数量）を整数値に変換して代入
      @total_amount += item.amount
      @items << item
      # `item` オブジェクトを `@items` 配列に追加
    end
    @cart_items = current_customer.cart_items.all
  end

  def create
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items.all
    @order.save

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

  end

  def thanks
  end

  def index
  end

  def show

  end

  private

  def confirm_params
    params.require(:order).permit(:customer_id, :receipt_date, :receipt_time)
  end


  # def order_params
  #     params.require(:order).permit(:customer_id, :receipt_date, :receipt_time, :total_product_quantity, :charge, :total_product_amount, :payment_method, :is_receipt)
  # end
end
