class PurchaseAddress

  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id, :token, :authenticity_token

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number,format: {with: /\A[0-9]+\z/i, message: 'Half-width number'}, numericality: {less_than_or_equal_to: 99_999_999_999}
  end

  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :city, presence: true
  validates :house_number, presence: true
  validates :token, presence: true
  
  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end