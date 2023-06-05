class PurchaseDestination
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :municipality, :address, :building, :telephone_number, :purchase_id

  with_options presence: true do
    validates :user_id, :item_id, :post_code, :prefecture_id, :municipality, :address, :telephone_number, :purchase_id
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Destination.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building: building, telephone_number: telephone_number, purchase: purchase.id)
  end
end