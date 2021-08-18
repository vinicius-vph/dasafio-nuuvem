class AddProcessedAtToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_column :transactions, :processed_at, :datetime
  end
end
