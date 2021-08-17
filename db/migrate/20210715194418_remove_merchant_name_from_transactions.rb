class RemoveMerchantNameFromTransactions < ActiveRecord::Migration[6.0]
  def change
    remove_column :transactions, :merchant_name, :string
  end
end
