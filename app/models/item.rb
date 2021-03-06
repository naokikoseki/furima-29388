class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :fee
  belongs_to_active_hash :region
  belongs_to_active_hash :status
  belongs_to_active_hash :shipment_day

  belongs_to :user
  has_one :purchase

  has_one_attached :image
  validates :image, presence: true

 

  with_options presence: true do
    validates :name, length: {maximum: 40}
    validates :explanation, length: {maximum: 1000}
    validates :category_id, :status_id, :fee_id, :region_id, :shipment_day_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :price, format: {with: /\A[0-9]+\z/i, message: 'Half-width number'}, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: "Out of setting range"}
  end
end
