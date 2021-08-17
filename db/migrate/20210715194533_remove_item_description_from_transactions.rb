class RemoveItemDescriptionFromTransactions < ActiveRecord::Migration[6.0]
  def change
    remove_column :transactions, :item_description, :string
  end
end
