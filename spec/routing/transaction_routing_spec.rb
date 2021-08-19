require 'rails_helper'

RSpec.describe 'routes test', type: :routing do
  context 'GET' do
    it 'Should be able route to controller and action' do
      expect(get('/transaction')).to route_to('transaction#index')
    end
    it 'Should be able route to controller and action' do
      expect(get('/transaction/new')).to route_to('transaction#new')
    end
  end
  context 'POST' do
    it 'Should be able route to controller and action' do
      expect(post('/transaction')).to route_to('transaction#create')
    end
  end
end
