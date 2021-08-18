require 'rails_helper'

describe Item do
  context 'Item Validation' do
    it 'Should be able to see that attributes cannot be blank' do
      item = Item.new

      item.valid?

      expect(item.errors[:description]).to include('não pode ficar em branco')
    end
  end
end
