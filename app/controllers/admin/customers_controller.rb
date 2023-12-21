class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customers = Customer.all
    @customers = @customers.page(params[:page]).per(10)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
    redirect_to admin_customer_path(customer)
  end


  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :phone_number, :is_active)
    .tap { |p| p[:is_active] = p[:is_active] == 'true' }    # .tapメソッドは、オブジェクト自体を返し、オブジェクトに対してブロックを実行することができます
    # `:is_active`の値が文字列の"true"だった場合、それを真の値に変換して`:is_active`に再代入しています。
  end
end
