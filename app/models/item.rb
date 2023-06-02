class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :category
  belongs_to :state
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :waiting_days_until_shipment
  belongs_to :user
  validates :image, :name, :outline, :user_id, presence: true
  validates :category_id, :state_id, :postage_id, :prefecture_id, :waiting_days_until_shipment_id,
            presence: true, numericality: {other_than: 1, message: "can't be blank"}
  with_options presence: true, numericality: {in: 300..9999999}, format: {with: /\A[\d]+\z/} do
    validates :price
  end
end
