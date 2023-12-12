class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :phone_number)
  end
end
