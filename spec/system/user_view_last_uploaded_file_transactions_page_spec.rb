require 'rails_helper'

describe 'User view transaction results page' do
  context 'Last File Uploaded' do
    it 'Should be able view transactions of last uploaded file' do
      visit new_transaction_path
      attach_file 'transaction_tab_input', Rails.root.join('example_input_two.tab')
      click_on 'Enviar'

      visit new_transaction_path
      attach_file 'transaction_tab_input', Rails.root.join('example_input.tab')
      click_on 'Enviar'

      expect(current_path).to eq(transaction_index_path)
      expect(page).to have_text('Analisador de Transações Financeiras')
      expect(page).to have_text('Importado com sucesso !')
      expect(page).to have_text('Lista das transações importadas')
      expect(page).to have_text('Nome da Loja')
      expect(page).to have_text("Bob's Pizza")
      expect(page).to have_text("Tom's Awesome Shop")
      expect(page).to have_text('Store Emporium')

      expect(page).to have_text('Receita Bruta do Último Upload')
      expect(page).to have_text('R$ 20,00')
      expect(page).to have_text('R$ 50,0')
      expect(page).to have_text('R$ 25,00')
    end
  end
end
