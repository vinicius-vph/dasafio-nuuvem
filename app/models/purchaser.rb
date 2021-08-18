class Purchaser < ApplicationRecord
  has_many :transactions
  has_many :merchants, through: :transactions
  has_many :items, through: :transactions

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
