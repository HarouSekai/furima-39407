class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :category
  belongs_to :state
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :waiting_days_until_shipment
  belongs_to :user
end
