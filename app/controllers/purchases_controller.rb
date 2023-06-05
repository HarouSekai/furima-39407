class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @purchase_destination = PurchaseDestination.new
  end

  def create
  end
  
end
