class Merchant < ApplicationRecord
  has_many :transactions, inverse_of: :merchant
  has_many :items, through: :transactions
  has_many :purchasers, through: :transactions

  validates :name, :address, presence: true, uniqueness: { case_sensitive: false }
end
