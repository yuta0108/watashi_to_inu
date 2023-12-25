class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_cart_item, only: [:create, :update]

  def index

    @cart_items = current_customer.cart_items.all
    # customer:cart_items = 1:n sの複数形
    @order = Order.new
    @total = @cart_items.sum { |cart_item| cart_item.amount * cart_item.item.tax_included_price }
    # `sum`メソッドは、各要素に対してブロック内の処理を行い、その結果を合計する,`@cart_items`の各要素を1つずつ取り出す
  end

  def create

    @cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
    if @cart_item.present?
      #存在している確認
      @cart_item.amount += params[:cart_item][:amount].to_i
      # `@cart_item.amount`に`params[:cart_item][:amount].to_i`の値を加算
      @cart_item.save
    else
      cart_item = CartItem.new(cart_item_params)
      cart_item.customer_id = current_customer.id
      cart_item.save
    end
    redirect_to public_cart_items_path
  end

  def destroy_all
    cart_items = current_customer.cart_items
    cart_items.destroy_all
    redirect_to public_cart_items_path
  end

  def destroy
    delete_cart_item = CartItem.find(params[:id])
    delete_cart_item.destroy
    redirect_to public_cart_items_path
  end

  def update
    @cart_item = current_customer.cart_items.find(params[:id])
    if @cart_item
      if @cart_item.update(amount: params[:amount].to_i)
        flash[:notice] = '更新されました'
      else
        flash[:alert] = '更新に失敗しました'
      end
    else
      flash[:alert] = 'カートアイテムが見つかりません'
    end

    redirect_to public_cart_items_path
  end

  def sum_of_price
    amount * item.tax_included_price
  end

  def set_cart_item
    @cart_item = current_customer.cart_items.find_by(item_id: params[:item_id])
  end

  private

  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end

end
