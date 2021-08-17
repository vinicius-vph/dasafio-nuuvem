class Merchant < ApplicationRecord
  has_many :transactions, inverse_of: :merchant
  has_many :items, through: :transactions
  has_many :purchasers, through: :transactions
end
