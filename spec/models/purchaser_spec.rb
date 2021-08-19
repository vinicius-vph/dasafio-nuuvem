require 'rails_helper'

RSpec.describe Purchaser, type: :model do
  context 'Purchaser Begin' do
    it 'Should be able has none to begin with' do
      expect(Purchaser.count).to eq 0
    end
    it 'Should be able has one after adding one' do
      Purchaser.create(name: 'Jonh Doe')
      expect(Purchaser.count).to eq 1
    end
    it 'Should not be able has none after one was created in a previous example' do
      expect(Purchaser.count).to eq 0
    end
  end
end

RSpec.describe Purchaser, type: :model do
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
    it 'Should be able generate an record error' do
      expect { Purchaser.create! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
