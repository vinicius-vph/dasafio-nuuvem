class Transaction < ApplicationRecord
  belongs_to :purchaser
  belongs_to :merchant, inverse_of: :transactions
  belongs_to :item

  scope :total_transactions, lambda {
                               select(:merchant, :item_price, :purchase_count)
                                 .group(:merchant)
                                 .total_cost
                             }

  def self.total_cost
    sum('item_price * purchase_count')
  end
end
