class PurchasesController < ApplicationController
  before_action :find_item

  def index
    @purchase_destination = PurchaseDestination.new
  end

  def create
    @purchase_destination = PurchaseDestination.new(purchase_destination_params)
    if @purchase_destination.valid?
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
    params.require(:purchase_destination).permit(:post_code, :prefecture_id, :municipality, :address, :building, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
