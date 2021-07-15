require 'rails_helper'

describe 'User upload tab file' do
  it '- Should be able upload tab file' do
    visit root_path
    attach_file 'tab_input', Rails.root.join('example_input.tab')
    click_on 'Enviar'

    expect(current_path).to_not eq(root_path)
    expect(page).to_not have_text('Faça upload do arquivo para análise')
    expect(page).to_not have_css('input#tab_input')
    expect(page).to_not have_button('Enviar')
  end

  it '- Should be able upload file and view transactions results' do
    visit root_path
    attach_file 'tab_input', Rails.root.join('example_input.tab')
    click_on 'Enviar'

    expect(current_path).to eq(transaction_results_path)
    expect(page).to have_text('Importado com sucesso !')
    expect(page).to have_text('Lista das transações importadas')
    expect(page).to have_text('Loja')
    expect(page).to have_text('Receita Bruta Total')
  end
end
