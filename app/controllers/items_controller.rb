class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :find_item, only: [:show, :edit, :update]
  before_action :move_to_root, only: [:edit, :update]

  def index
    @items = Item.order(created_at: 'DESC')
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
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

  def find_item
    @item = Item.find(params[:id])
  end

  def move_to_root
    return unless current_user != @item.user

    redirect_to root_path
  end
end
