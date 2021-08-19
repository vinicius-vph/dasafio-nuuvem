require 'rails_helper'

RSpec.describe TransactionController, type: :controller do
  context 'GET index' do
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

RSpec.describe TransactionController, type: :controller do
  context 'GET new' do
    it 'Should be able has a 200 status code' do
      get :new
      expect(response.status).to eq(200)
    end
    it 'Should be able has a correct content type' do
      get :new
      expect(response.content_type).to eq 'text/html; charset=utf-8'
    end
    it 'Should be able has a correct media type' do
      get :new
      expect(response.media_type).to eq 'text/html'
    end
    it 'Should be able has a empty body' do
      get :new
      expect(response.body).to eq ''
    end
  end
end

RSpec.describe TransactionController, type: :controller do
  context 'POST create' do
    it 'Should be able generate an parameter error' do
      expect { post :create }.to raise_error(ActionController::ParameterMissing)
    end
  end
end
