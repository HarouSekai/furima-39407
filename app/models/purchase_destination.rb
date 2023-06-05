class PurchaseDestination
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :municipality, :address, :building, :telephone_number, :purchase_id

  with_options presence: true do
    validates :user_id, :item_id, :post_code, :prefecture_id, :municipality, :address, :telephone_number, :purchase_id
  end
end