require 'rails_helper'

RSpec.describe Transaction, type: :model do
  context 'Transaction Begin' do
    it 'Should be able has none to begin with' do
      expect(Transaction.count).to eq 0
    end
    it 'Should be able has one after adding one' do
      purchaser = Purchaser.create(name: 'Jonh Doe')
      merchant = Merchant.create(name: 'Ruby Store', address: 'rails street, 123')
      item_ = Item.create(description: 'Some description')
      Transaction.create(item_price: 70, purchase_count: 7, purchaser_id: purchaser.id, merchant_id: merchant.id,
                         item_id: item_.id, processed_at: Time.new)

      expect(Transaction.count).to eq 1
    end
    it 'Should not be able has none after one was created in a previous test' do
      expect(Transaction.count).to eq 0
    end
  end
end

RSpec.describe Transaction, type: :model do
  context 'Transaction Validation' do
    it 'Should be able to see that attributes cannot be blank' do
      transaction = Transaction.new

      transaction.valid?

      expect(transaction.errors[:item_price]).to include('não pode ficar em branco')
      expect(transaction.errors[:purchase_count]).to include('não pode ficar em branco')
      expect(transaction.errors[:purchaser_id]).to include('não pode ficar em branco')
      expect(transaction.errors[:merchant_id]).to include('não pode ficar em branco')
      expect(transaction.errors[:item_id]).to include('não pode ficar em branco')
      expect(transaction.errors[:processed_at]).to include('não pode ficar em branco')
    end
    it 'Should be able generate an record error' do
      expect { Transaction.create! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end

RSpec.describe Transaction, type: :model do
  context 'Transaction Methods Validation' do
    it 'Should be able to see that method total_cost return correct results' do
      purchaser = Purchaser.create(name: 'Jonh Doe')
      merchant = Merchant.create(name: 'Ruby Store', address: 'rails street, 123')
      item_ = Item.create(description: 'Some description')
      Transaction.create(item_price: 70, purchase_count: 7, purchaser_id: purchaser.id, merchant_id: merchant.id,
                         item_id: item_.id, processed_at: Time.new)

      transaction = Transaction.select(:merchant, :item_price, :purchase_count, :processed_at).group(:merchant)

      expect(transaction.total_cost).to eq(merchant => 490)
    end
  end
end
