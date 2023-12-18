# frozen_string_literal: true


class Public::SessionsController < Devise::SessionsController
  before_action :configure_permitted_parameters, if: :devise_controller?

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

