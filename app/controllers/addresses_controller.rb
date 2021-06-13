class AddressesController < ApplicationController
  before_action :authenticate_customer!
  def index
    @addresses = current_customer.addresses.all
    @address = Address.new
  end

  def create
   @address = Address.new(address_params)
   @address.customer_id = current_customer.id
   @address.save
   redirect_to addresses_path
  end

  def edit
   @address = Address.find(params[:id])
  end

  def update
   address = Address.find(params[:id])
   address.update(address_params)
   redirect_to addresses_path
  end
  private
  def address_params
    params.required(:address).permit(:customer_id, :name, :postal_code, :shipping_address)
  end
end
