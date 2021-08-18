class Transaction < ApplicationRecord
  belongs_to :purchaser
  belongs_to :merchant, inverse_of: :transactions
  belongs_to :item

  validates :item_price, :purchase_count, :purchaser_id, :merchant_id, :item_id, :processed_at, presence: true

  scope :total_transactions, lambda {
                               select(:merchant, :item_price, :purchase_count, :processed_at)
                                 .group(:merchant)
                                 .total_cost
                             }

  scope :last_uploaded_file, -> { where(processed_at: present? ? last.processed_at : Date.current) }

  def self.total_cost
    sum('item_price * purchase_count')
  end
end
