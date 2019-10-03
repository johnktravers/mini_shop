class MerchantsController < ApplicationController

  def index
    @merchants = Merchant.all
  end

  def items_index
    @merchant = Merchant.find(params[:merchant_id])
    @items = @merchant.items
  end

  def show
    @merchant = Merchant.find(params[:id])
  end

  def new
  end

  def create
    Merchant.create!(merchant_params)
    redirect_to '/merchants'
  end

  def edit
    @merchant = Merchant.find(params[:id])
  end

  def update
    merchant = Merchant.find(params[:id])
    merchant.update(merchant_params)

    redirect_to "/merchants/#{merchant.id}"
  end

  def destroy
    Merchant.destroy(params[:id])
    redirect_to '/merchants'
  end

  private
  def merchant_params
    params
      .require(:merchant)
      .permit(:name, :address, :city, :state, :zip)
  end

end
