require 'rails_helper'

describe 'User view trabsaction results page' do
  context 'Last File Uploaded' do
    it 'Should be able view transactions of last uploaded file' do
      visit root_path
      click_on 'Fazer upload de novo arquivo'
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

  xcontext 'Total all time' do
    it '- Should be able view results page' do
      visit transaction_results_path

      expect(current_path).to eq(transaction_results_path)
      expect(page).to have_text('Lista das transações importadas')
      expect(page).to have_text('Nome da Loja')
      expect(page).to have_text('Receita Bruta Total')
      expect(page).to have_text('Nenhum dado disponível')
    end

    it '- Should be able view results page with merchant transactions' do
      visit root_path
      attach_file 'tab_input', Rails.root.join('example_input.tab')
      click_on 'Enviar'

      visit root_path
      attach_file 'tab_input', Rails.root.join('example_input_two.tab')
      click_on 'Enviar'

      expect(current_path).to eq(transaction_results_path)
      expect(Transaction.count).to eq(9)

      expect(page).to have_text('Lista das transações importadas')

      expect(page).to have_text('Nome da Loja')
      expect(page).to have_text("Bob's Pizza")
      expect(page).to have_text("Tom's Awesome Shop")
      expect(page).to have_text('Store Emporium')

      expect(page).to have_text('Receita Bruta Total')
      expect(page).to have_text('R$ 40,00')
      expect(page).to have_text('R$ 140,0')
      expect(page).to have_text('R$ 50,00')
    end
  end
end
