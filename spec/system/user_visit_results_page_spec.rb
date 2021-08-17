require 'rails_helper'

describe 'User visit results page' do
  context 'Results page' do
    it 'Should be able view results page' do
      visit root_path
      click_on 'Ver transações salvas'
      expect(current_path).to eq(transaction_index_path)
      expect(page).to have_text('Analisador de Transações Financeiras')
      expect(page).to have_link('Voltar')
      expect(page).to have_text('Lista das transações importadas')
      expect(page).to have_text('Nome da Loja')
      expect(page).to have_text('Receita Bruta do Último Upload')
      expect(page).to have_text('Receita Bruta Total')
      expect(page).to have_text('Nenhum dado disponível')
    end
    it 'Should be able back to homepage' do
      visit transaction_index_path
      click_on 'Voltar'
      expect(current_path).to_not eq(transaction_index_path)
      expect(current_path).to eq(root_path)
    end
  end
end
