class PurchasesController < ApplicationController
  before_action :find_item

  def index
    @purchase_destination = PurchaseDestination.new
  end

  def create
    @purchase_destination = PurchaseDestination.new(purchase_destination_params)
    if @purchase_destination.valid?
      pay_item
      @purchase_destination.save
      redirect_to root_path
    else
      render :index
    end
  end
  
  private

  def find_item
    @item = Item.find(params[:item_id])
  end

  def purchase_destination_params
    params.require(:purchase_destination).permit(:post_code, :prefecture_id, :municipality, :address, :building, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id]).merge(token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_destination_params[:token],
        currency: 'jpy'
      )
  end
end
