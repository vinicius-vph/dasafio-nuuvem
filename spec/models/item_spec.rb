require 'rails_helper'

RSpec.describe Item, type: :model do
  context 'Item Begin' do
    it 'Should be able has none to begin with' do
      expect(Item.count).to eq 0
    end
    it 'Should be able has one after adding one' do
      Item.create(description: 'Some description')
      expect(Item.count).to eq 1
    end
    it 'Should not be able has none after one was created in a previous example' do
      expect(Item.count).to eq 0
    end
  end
end

RSpec.describe Item, type: :model do
  context 'Item Validation' do
    it 'Should be able to see that attributes cannot be blank' do
      item = Item.new

      item.valid?

      expect(item.errors[:description]).to include('não pode ficar em branco')
    end
    it 'Should be able generate an record error' do
      expect { Item.create! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
