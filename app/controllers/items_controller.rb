class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  private

  def item_params
    params.require(:item).permit(
      :image,
      :name,
      :outline,
      :category_id,
      :state_id,
      :postage_id,
      :prefecture_id,
      :waiting_days_until_shipment_id,
      :price
    ).merge(user_id: current_user.id)
  end
end
