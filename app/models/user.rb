class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases

  with_options presence: true do
    validates :email, uniqueness: true
    validates :password, confirmation: true, length: {minimum: 6}, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
    validates :family_name, :first_name, format: {with: /\A[ぁ-んァ-ン一-龥]/}
    validates :family_name_kana, :first_name_kana, format: {with: /\A[ァ-ヶー－]+\z/}
  end
end
