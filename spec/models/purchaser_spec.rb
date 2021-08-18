require 'rails_helper'

describe Purchaser do
  context 'Purchaser Validation' do
    it 'Should be able to see that attributes cannot be blank' do
      purchaser = Purchaser.new

      purchaser.valid?

      expect(purchaser.errors[:name]).to include('não pode ficar em branco')
    end
    it 'Should be able to see that attributes must be unique' do
      Purchaser.create!(name: 'Jonh Doe')
      purchaser = Purchaser.new(name: 'Jonh Doe')

      purchaser.valid?

      expect(purchaser.errors[:name]).to include('já está em uso')
    end
  end
end
