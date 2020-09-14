class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :address

  #with_options presence: true, foreign_key: true 
end
