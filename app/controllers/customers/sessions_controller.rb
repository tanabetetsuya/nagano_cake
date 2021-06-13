# frozen_string_literal: true

class Customers::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
   before_action :reject_inactive_user, only: [:create]

  def after_sign_in_path_for(resource)
    root_path
  end

  def reject_inactive_user
    @customer = Customer.find_by(last_name: params[:customer][:last_name])
    if @customer
      if @customer.valid_password?(params[:customer][:password]) && !@customer.is_valid
        redirect_to new_customer_session_path
      end
    end
  end
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
