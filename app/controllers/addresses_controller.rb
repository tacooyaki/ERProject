class AddressesController < ApplicationController
  before_action :set_user, only: [:new, :create]
  before_action :authenticate_user!

  def new
    @address = Address.new
  end

  def create
    @address = @user.addresses.build(address_params)
    if @address.save
      redirect_to user_path(@user), notice: 'Address was successfully added.'
    else
      render :new
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def address_params
    params.require(:address).permit(:street, :city, :province, :postal_code, :country)
  end
end
