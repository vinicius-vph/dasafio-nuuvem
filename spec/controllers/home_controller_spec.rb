require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'GET index' do
    it 'Should be able has a 200 status code' do
      get :index
      expect(response.status).to eq(200)
    end
    it 'Should be able has a correct content type' do
      get :index
      expect(response.content_type).to eq 'text/html; charset=utf-8'
    end
    it 'Should be able has a correct media type' do
      get :index
      expect(response.media_type).to eq 'text/html'
    end
    it 'Should be able has a empty body' do
      get :index
      expect(response.body).to eq ''
    end
  end
end
