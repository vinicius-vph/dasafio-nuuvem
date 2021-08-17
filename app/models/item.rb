class Item < ApplicationRecord
  has_many :transactions
  has_many :merchants, through: :transactions
  has_many :purchasers, through: :transactions
end
