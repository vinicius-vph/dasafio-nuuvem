class AddReferencesPurchasertoTransaction < ActiveRecord::Migration[6.0]
  def change
    add_reference :transactions, :purchaser, null: false, foreign_key: true
  end
end
