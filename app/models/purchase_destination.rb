class PurchaseDestination
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :municipality, :address, :building, :telephone_number, :token

  with_options presence: true do
    validates :user_id, :item_id
    validates :token
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'は不正な値です。ハイフン (-) を入れてください' }
    validates :prefecture_id, numericality: { other_than: 1, message: "を選んでください" }
    validates :municipality, :address
    validates :telephone_number, format: { with: /\A[0-9]{10,11}\z/ }
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Destination.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, address: address,
                       building: building, telephone_number: telephone_number, purchase_id: purchase.id)
  end
end
