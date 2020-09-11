class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_many :comments

  with_options presence: true do
    #validates :user_id, foreign_key: true
  end
end
