class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_many :comments
  has_one_attached :image

  with_options presence: true do
    validates :name, length: {maximum: 40}
    validates :explanation, length: {maximum: 1000}
    validates :category, :status, :fee, :region, :shipment_day, numericality: { other_than: 0, message: "can't be blank" }
    validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: "Out of setting range"}, format: {with: /\A[0-9]+\z/, message: 'Half-width number'}
  end
end
