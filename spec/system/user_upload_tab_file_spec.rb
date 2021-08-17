require 'rails_helper'

describe 'User upload tab file' do
  context 'Upload' do
    it 'Should be able upload tab file' do
      visit new_transaction_path
      attach_file 'transaction_tab_input', Rails.root.join('example_input.tab')
      click_on 'Enviar'

      expect(current_path).to_not eq(root_path)
      expect(page).to_not have_text('Faça upload do arquivo para análise')
      expect(page).to_not have_css('input#tab_input')
      expect(page).to_not have_button('Enviar')
    end
    it 'Should be able upload tab file and view results page' do
      visit new_transaction_path
      attach_file 'transaction_tab_input', Rails.root.join('example_input.tab')
      click_on 'Enviar'

      expect(current_path).to eq(transaction_index_path)
      expect(page).to have_text('Importado com sucesso !')
      expect(page).to have_text('Lista das transações importadas')
      expect(page).to have_text('Nome da Loja')
      expect(page).to have_text('Receita Bruta do Último Upload')
      expect(page).to have_text('Receita Bruta Total')
    end
  end
end
