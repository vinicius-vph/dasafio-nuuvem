require 'rails_helper'

describe 'User visit homepage' do
  context 'Homepage' do
    it 'Should be able access homepage' do
      visit root_path
      expect(current_path).to eq(root_path)
      expect(page).to have_text('Analisador de Transações Financeiras')
      expect(page).to have_link('Fazer upload de novo arquivo')
      expect(page).to have_link('Ver transações salvas')
    end
  end
end
