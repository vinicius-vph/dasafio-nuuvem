require 'rails_helper'

RSpec.describe Merchant, type: :model do
  context 'Merchant Begin' do
    it 'Should be able has none to begin with' do
      expect(Merchant.count).to eq 0
    end
    it 'Should be able has one after adding one' do
      Merchant.create(name: 'Ruby Store', address: 'rails street, 123')
      expect(Merchant.count).to eq 1
    end
    it 'Should not be able has none after one was created in a previous example' do
      expect(Merchant.count).to eq 0
    end
  end
end

RSpec.describe Merchant, type: :model do
  context 'Merchant Validation' do
    it 'Should be able to see that attributes cannot be blank' do
      merchant = Merchant.new

      merchant.valid?

      expect(merchant.errors[:name]).to include('não pode ficar em branco')
      expect(merchant.errors[:address]).to include('não pode ficar em branco')
    end
    it 'Should be able to see that attributes must be unique' do
      Merchant.create!(name: 'Ruby Store', address: 'rails street, 123')
      merchant = Merchant.new(name: 'Ruby Store', address: 'rails street, 123')

      merchant.valid?

      expect(merchant.errors[:name]).to include('já está em uso')
      expect(merchant.errors[:name]).to include('já está em uso')
    end
    it 'Should be able generate an record error' do
      expect { Merchant.create! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
