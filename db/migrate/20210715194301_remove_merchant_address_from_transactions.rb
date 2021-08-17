class RemoveMerchantAddressFromTransactions < ActiveRecord::Migration[6.0]
  def change
    remove_column :transactions, :merchant_address, :string
  end
end
