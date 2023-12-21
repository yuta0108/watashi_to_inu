# frozen_string_literal: true


class Public::SessionsController < Devise::SessionsController
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :reject_inactive_customer, only: [:create]


  def reject_inactive_customer
    @customer = Customer.find_by(email: params[:customer][:email])  # `params[:customer][:password]`が正しいパスワードであるかどうかを確認
    if @customer
      # `is_actives`はCustomerクラスのクラスメソッドであり、`is_active`をキーとして、真偽値を値とするハッシュです。`!`演算子を使用、`@customer.is_active`が真の場合には`false`
      if @customer.valid_password?(params[:customer][:password]) && !Customer.is_actives[@customer.is_active]
         flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
        redirect_to new_customer_session_path
      else
        flash[:notice] = "項目を入力してください"
      end
    end
  end


  # GET /resource/sign_in
  # def new
  #   super
  # end

  def guest_sign_in
    customer = Customer.guest
    sign_in customer
    redirect_to root_path, notice: "ゲストでログインしました。"
  end

  def after_sign_in_path_for(public)
     public_customer_path(current_customer)
  end

  def after_sign_out_path_for(public)
     root_path
  end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
  end
end

