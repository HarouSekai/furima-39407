class PurchasesController < ApplicationController

  def index
    @purchase_destination = PurchaseDestination.new
  end

  def create
  end
  
end
