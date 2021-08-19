require 'rails_helper'

RSpec.describe 'routes test', type: :routing do
  context 'GET' do
    it 'Should be able route to controller and action' do
      expect(get('/')).to route_to('home#index')
    end
  end
end
