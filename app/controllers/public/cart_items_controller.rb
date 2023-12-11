class Public::CartItemsController < ApplicationController

  before_action :set_cart_item, only: [:create, :update]

  def index
    @cart_items = current_customer.cart_items.all
  end

  def create
    if @cart_item
      @cart_item.amount += params[:cart_item][:amount].to_i
      # `@cart_item.amount`に`params[:cart_item][:amount].to_i`の値を加算
      @cart_item.save
      redirect_to public_cart_items_path
    else
      cart_item = CartItem.new(cart_item_params)
      cart_item.customer_id = current_customer.id
      cart_item.save
      redirect_to public_cart_items_path
    end

  end

  def destroy
    delete_cart_item = CartItem.find(params[:id])
    delete_cart_item.destroy
    redirect_to public_cart_items_path(current_customer)
  end

  def destroy_all
    cart_items = current_customer.cart_items.all
    cart_items.destroy_all
    redirect_to public_cart_items_path(current_customer)
  end

  def update
    if @cart_item.update(amount: params[:amount].to_i)
      flash[:notice] = '更新されました'
    else
      flash[:alert] = '更新に失敗しました'
    end
    redirect_to  public_cart_items_path(current_customer)
  end



  private

  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount, :receipt_date, :receipt_date_time)
  end
  
  def set_cart_item
    @cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
  end
  
end
