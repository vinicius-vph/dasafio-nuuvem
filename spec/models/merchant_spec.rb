require 'rails_helper'

describe Merchant do
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
  end
end
