require 'rails_helper'

describe 'User visit upload page' do
  context 'Upload page' do
    it 'Should be able access upload page' do
      visit root_path
      click_on 'Fazer upload de novo arquivo'
      expect(current_path).to eq(new_transaction_path)
      expect(page).to have_text('Analisador de Transações Financeiras')
      expect(page).to have_link('Voltar')
      expect(page).to have_text('Faça upload do arquivo para análise')
      expect(page).to have_css('input#transaction_tab_input')
      expect(page).to have_button('Enviar')
    end
    it 'Should be able back to homepage' do
      visit new_transaction_path
      click_on 'Voltar'
      expect(current_path).to_not eq(new_transaction_path)
      expect(current_path).to eq(root_path)
    end
  end
end
