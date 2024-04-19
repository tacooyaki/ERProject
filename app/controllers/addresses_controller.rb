class AddressesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_address, only: [:edit, :update]


  def new
    @address = Address.new
  end

  def edit
  end

  def create
    @address = @user.addresses.build(address_params)
    if @address.save
      redirect_to user_path(@user), notice: 'Address was successfully added.'
    else
      render :new
    end
  end

  def update
    if @address.update(address_params)
      redirect_to user_path(@user), notice: 'Address was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_address
    @address = @user.addresses.find(params[:id])
  end

  def address_params
    params.require(:address).permit(:street, :city, :province, :postal_code, :country)
  end
end
