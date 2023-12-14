class Public::OrdersController < ApplicationController
  def confirm
    @order = current_customer.orders
  end

  def thanks
  end

  def index
  end

  def show
  end
end
