class Public::OrdersController < ApplicationController
  def confirm
  end

  def thanks
  end

  def index
  end

  def show
    @order = Order.find(params[:id])
  end
end
