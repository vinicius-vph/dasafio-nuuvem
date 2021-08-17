class AddReferencesMerchantToTransaction < ActiveRecord::Migration[6.0]
  def change
    add_reference :transactions, :merchant, null: false, foreign_key: true
  end
end
