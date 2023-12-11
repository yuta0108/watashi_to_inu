class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
  end

  def edit
  end

  private

  def customer_params
    params.requier(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :phone_number)
  end
end
